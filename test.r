N <- 5
sigma <- 1.5
theta_max <- 0
number_datapoints <- 1000
alpha <- 0.01
connectivity <- 0.3
data_A_comp <- simulate_A_matrix_acyclic(N, C=connectivity, sigma)
data_A_comp <- simulate_A_matrix(N, C=connectivity, sigma)
system.time(data_x_comp <- simulate_x_data_Julia(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
#system.time(data_x_comp <- simulate_x_data(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
data_x_comp1<- remove_zero_data(data_x_comp)
data_A_comp_1 <- A_matrix_to_Adj(data_A_comp = data_A_comp)
#data_x_comp_error <- add_error(data_x_comp, 0.1, number_datapoints)
latent_variables_comp <- simulate_latent_variables_comp(N,p=0)
true_pag_comp <- A_comp_to_pag_comp(data_A_comp = data_A_comp_1,latent_variables_comp = latent_variables_comp)

learned_pag_comp <- data_to_pag_comp(data_x_comp = data_x_comp, latent_variables_comp = latent_variables_comp,0.01)
#learned_pag_comp <- data_to_pag_comp(data_x_comp = data_x_comp_error, latent_variables_comp = latent_variables_comp,0.01)

precision_comp <-c()
for (i in 1:20){
  precision_comp[i] <- precision_pag(true_pag = true_pag_comp[[i]], learned_pag = learned_pag_comp[[i]])
}
recall_comp <- c()
for (i in 1:20){
  recall_comp[i] <- recall_pag(true_pag = true_pag_comp[[i]], learned_pag = learned_pag_comp[[i]])
}
adjprecision_comp <- c()
for (i in 1:20){
  adjprecision_comp[i] <- adjprecision_pag(true_pag = true_pag_comp[[i]], learned_pag = learned_pag_comp[[i]])
}
adjrecall_comp <- c()
for (i in 1:20){
  adjrecall_comp[i] <- adjrecall_pag(true_pag = true_pag_comp[[i]], learned_pag = learned_pag_comp[[i]])
}

mean(precision_comp)
mean(recall_comp)
mean(adjprecision_comp)
mean(adjrecall_comp)


precision_comp_GFCI <-c()
for (i in 1:20){
  precision_comp_GFCI[i] <- precision_pag(true_pag = true_pag_comp[[i]], learned_pag = learned_pag_comp_GFCI[[i]])
}
recall_comp_GFCI <- c()
for (i in 1:20){
  recall_comp_GFCI[i] <- recall_pag(true_pag = true_pag_comp[[i]], learned_pag = learned_pag_comp_GFCI[[i]])
}
adjprecision_comp_GFCI <- c()
for (i in 1:20){
  adjprecision_comp_GFCI[i] <- adjprecision_pag(true_pag = true_pag_comp[[i]], learned_pag = learned_pag_comp_GFCI[[i]])
}
adjrecall_comp_GFCI <- c()
for (i in 1:20){
  adjrecall_comp_GFCI[i] <- adjrecall_pag(true_pag = true_pag_comp[[i]], learned_pag = learned_pag_comp_GFCI[[i]])
}
mean(precision_comp_GFCI)
mean(recall_comp_GFCI)
mean(adjrecall_comp_GFCI)
mean(adjprecision_comp_GFCI)
precision_comp
i <-3
par(mfrow=c(1,2))
plotAG(true_pag_comp[[i]]@amat)
plotAG(learned_pag_comp[[i]]@amat)
precision_comp[i]
recall_comp[i]
adjrecall_comp[i]
data_A_comp[[i]]
data_A_comp_1[[i]]

i <-i+1
pag2cycles(true_pag_comp[[i]])
plotAG(true_pag_comp[[i]]@amat)
data_A_comp_1[[i]]
plot(as(data_A_comp_1[[i]],"graphNEL"))
plot(dag2cpdag(as(data_A_comp_1[[i]],"graphNEL")))
