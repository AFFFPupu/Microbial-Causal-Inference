options(JULIA_HOME = "/home/aofu/julia-1.8.5/bin/")
library(JuliaCall)
julia <- julia_setup()
de <- diffeqr::diffeq_setup()
JuliaCall::julia_library("LinearAlgebra")
JuliaCall::julia_eval("
function f_HollingII(x, theta)
    N = length(x)
    x./(ones(N,1) + theta.*x)
end
")
JuliaCall::julia_eval("
function system_dynamics!(dx, x, p, t)
    N = length(x)

    # Get (A, r, theta) from p = [A r theta]
    A = p[1:N, 1:N]
    r = p[1:N, N+1]
    theta = p[1:N, N+2]

    # If some species start with negative abundance, make them zero
    pos = findall(x .<= 0)
    x[pos] .= 0

    # System dynamics
    hollingII_term = f_HollingII(x, theta)
    dx .= (Diagonal(x) * (A * hollingII_term .+ r))
end
")


solve_system_dynamics <- function(A, r, theta, x0, tspan){
  #Example: A <- matrix(
  # c(-1.000000,  1.552315,  0.000000,  0.000000,
  # 0.000000, -1.000000,  0.000000,  0.000000,
  # 1.761856,  0.000000, -1.000000, -0.457249,
  # 0.000000,  0.000000, -1.399008, -1.000000), nrow = 4, byrow = TRUE)
  # r <- c(0.1, -0.1, 0.05, -0.05)
  # theta <- c(1.0, 1.0, 1.0, 1.0)
  # x0 <- c(1.0,1.0,1.0,1.0)
  # tspan <- c(0.0, 100.0)
  p <- cbind(A, r, theta)
  JuliaCall::julia_assign("x0", x0)
  JuliaCall::julia_assign("p", p)
  JuliaCall::julia_assign("tspan", tspan)
  prob <- JuliaCall::julia_eval("ODEProblem(system_dynamics!, x0, tspan, p)")
  sol = de$solve(prob,de$Tsit5(),saveat=0.5)
  mat <- sapply(sol$u,identity)
  udf <- as.data.frame(t(mat))
  return(udf)
}



simulate_x_data_onematrix_julia <- function(A_matrix, theta_max, number_datapoints){
  data_x <- data.frame(Date=as.Date(character()),
                              File=character(), 
                              User=character(), 
                              stringsAsFactors=FALSE) 
  node_label <- c()
  for (i in 1:N){
    node_label[i] <- paste0('x',i)
  }
  for (i in 1:number_datapoints){
    xd <- runif(N)
    theta = runif(N) * theta_max
    r <- xd/(1+theta*xd)
    x0 <- runif(N)
    x<- solve_system_dynamics(A = A_matrix, r=r, theta = theta, x0=x0,tspan=tspan)
    data_x <- rbind(data_x, x[nrow(x),])
  }
  names(data_x) <- node_label
  rownames(data_x) <- NULL
  
  return(data_x)
}

simulate_x_data_Julia <- function(N, theta_max, number_datapoints, data_A_comp){
  data_x_comp <- list()
  node_label <- c()
  for (i in 1:N){
    node_label[i] <- paste0('x',i)
  }
  for (k in 1:20){
    A_matrix <- data_A_comp[[k]]
    data_x <- simulate_x_data_onematrix_julia(A_matrix,theta_max = theta_max,number_datapoints)
    rownames(data_x) <- NULL
    data_x_comp[[length(data_x_comp)+1]] <- data_x
    print(paste0(k, 'finish!!!'))
  }
  return(data_x_comp)
}
matrix_to_adj <- function(A_matrix){
  for (i in 1:N){
    for (j in 1:N){
      if (i==j){
        A_matrix[i,j] <- 0
      }
      if (i!=j){
        if (A_matrix[i,j]!=0){
          A_matrix[i,j]=1
        }
      }
    }
  }
  return(A_matrix)
}
matrix_to_pag <- function(A_matrix){
  for (i in 1:N){
    for (j in 1:N){
      if (i==j){
        A_matrix[i,j] <- 0
      }
      if (i!=j){
        if (A_matrix[i,j]!=0){
          A_matrix[i,j]=1
        }
      }
    }
  }
  A_matrix <- t(A_matrix)
  A_matrix_acy <- acyclification(A_matrix)
  true_pag <- admg2pag(A_matrix_acy,latent_variables = c())
  return(true_pag)
}
pag2cycles <- function(pag){
  # pag: pcalg FCI pag
  g_cyclic <- as.undirected(graph_from_adjacency_matrix(pag@amat))
  cycles <- largest_cliques(g_cyclic)
  return(cycles)
}


N<-5
theta_max <- 0.5
A_cyclic <- matrix(
  c(-1, 0, 0, 0.5,
    0, -1, 0, 0,
    -0.5,0.7,-1,0,
    0,0,0.3,-1), nrow = 4,byrow = TRUE)

A_cyclic <- matrix(
  c(-1, 0, 0.5, 0.5,0,
    0.5, -1, 0, 0,0,
    0,0.7,-1,0,0,
    0,0,0,-1,0,
    0,0,0,-0.5,-1), nrow = 5,byrow = TRUE)

A_acyclic <- matrix(
  c(-1, 0.5, 0, -0.5,
    0, -1, 0, 0,
    0,0,-1,0,
    0,0,0,-1), nrow = 4,byrow = TRUE)
tspan <- c(0.0,100.0)

solve_system_dynamics(A = A_cyclic, r=r, theta = theta, x0=x0,tspan=tspan)

cycles <- pag2cycles(data_to_pag(x_data_cyclic,0.001,c()))

x_data_cyclic <- simulate_x_data_onematrix_julia(A_cyclic,10000)
theta_max <- 0
x_data_cyclic_linear <- simulate_x_data_onematrix_julia(A_cyclic,10000)
x_data_acyclic <- simulate_x_data_onematrix_julia(A_acyclic,1000)
plot(data_to_pag(x_data_cyclic,0.01,c()))
plot(data_to_pag(x_data_cyclic_linear,0.01,c()))
plot(matrix_to_pag(A_cyclic))
plot(data_to_pag(x_data_acyclic,0.05,c()))
plot(matrix_to_pag(A_acyclic))

cat('Identified absence (-1) and presence (+1) of direct causal relations from FCI PAG:\n')
print(pag2edge(data_to_pag(x_data_acyclic,0.05,c())@amat))
data_to_pag(x_data_cyclic,0.05,c())@amat
data_to_pag(x_data_acyclic,0.05,c())@amat
g_cyclic <- as.undirected(graph_from_adjacency_matrix(data_to_pag(x_data_cyclic,0.05,c())@amat))
cliques(g_cyclic,min = 2)
pag2cycles(data_to_pag(x_data_cyclic,0.05,c()))


i <-11
par(mfrow=c(1,2))
plot(data_to_pag(data_x_comp_acyclic[[i]],0.001,c()))
plot(matrix_to_pag( data_A_comp_acyclic_1[[i]]))
