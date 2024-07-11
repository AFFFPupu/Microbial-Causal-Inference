# Scalability analysis 
# n=5 c=0.4
# n=10 c=0.2
# n=20 c=0.1
# n=50 c=0.04
# number of data = 1000
# sigma = 0.5


#simulate n=5 c=0.3 cases for GLV and store it as Microbial_causal_inference/scalability/ScaleGLV5_...
N <- 5
sigma <- 1.2
theta_max <- 0
number_datapoints <- 1000
alpha <- 0.01
connectivity <- 0.3
data_A_comp <- simulate_A_matrix_acyclic(N, C=connectivity, sigma)
system.time(data_x_comp <- simulate_x_data_Julia(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
data_x_comp1<- remove_zero_data(data_x_comp)
data_A_comp_1 <- A_matrix_to_Adj(data_A_comp = data_A_comp)
latent_variables_comp <- simulate_latent_variables_comp(N,p=0)
true_pag_comp <- A_comp_to_pag_comp(data_A_comp = data_A_comp_1,latent_variables_comp = latent_variables_comp)
saveRDS(data_A_comp, file = "~/Microbial_causal_inference/scalability/ScaleGLV5_DataA.RDS")
saveRDS(data_x_comp, file = "~/Microbial_causal_inference/scalability/ScaleGLV5_Datax.RDS")
saveRDS(true_pag_comp, file = "~/Microbial_causal_inference/scalability/ScaleGLV5_truePAG.RDS")


#simulate n=10 c=0.2 cases for GLV and store it as Microbial_causal_inference/scalability/ScaleGLV10_...
N <- 10
sigma <- 1.2
theta_max <- 0
number_datapoints <- 1000
alpha <- 0.01
connectivity <- 0.2
data_A_comp <- simulate_A_matrix_acyclic(N, C=connectivity, sigma)
system.time(data_x_comp <- simulate_x_data_Julia(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
data_x_comp1<- remove_zero_data(data_x_comp)
data_A_comp_1 <- A_matrix_to_Adj(data_A_comp = data_A_comp)
latent_variables_comp <- simulate_latent_variables_comp(N,p=0)
true_pag_comp <- A_comp_to_pag_comp(data_A_comp = data_A_comp_1,latent_variables_comp = latent_variables_comp)
saveRDS(data_A_comp, file = "~/Microbial_causal_inference/scalability/ScaleGLV10_DataA.RDS")
saveRDS(data_x_comp, file = "~/Microbial_causal_inference/scalability/ScaleGLV10_Datax.RDS")
saveRDS(true_pag_comp, file = "~/Microbial_causal_inference/scalability/ScaleGLV10_truePAG.RDS")


#simulate n=20 c=0.1 cases for GLV and store it as Microbial_causal_inference/scalability/ScaleGLV20_...
N <- 20
sigma <- 1.2
theta_max <- 0
number_datapoints <- 1000
alpha <- 0.01
connectivity <- 0.1
data_A_comp <- simulate_A_matrix_acyclic(N, C=connectivity, sigma)
system.time(data_x_comp <- simulate_x_data_Julia(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
data_x_comp1<- remove_zero_data(data_x_comp)
data_A_comp_1 <- A_matrix_to_Adj(data_A_comp = data_A_comp)
latent_variables_comp <- simulate_latent_variables_comp(N,p=0)
true_pag_comp <- A_comp_to_pag_comp(data_A_comp = data_A_comp_1,latent_variables_comp = latent_variables_comp)
saveRDS(data_A_comp, file = "~/Microbial_causal_inference/scalability/ScaleGLV20_DataA.RDS")
saveRDS(data_x_comp, file = "~/Microbial_causal_inference/scalability/ScaleGLV20_Datax.RDS")
saveRDS(true_pag_comp, file = "~/Microbial_causal_inference/scalability/ScaleGLV20_truePAG.RDS")

#simulate n=50 c=0.04 cases for GLV and store it as Microbial_causal_inference/scalability/ScaleGLV50_...
N <- 50
sigma <- 1.2
theta_max <- 0
number_datapoints <- 1000
alpha <- 0.01
connectivity <- 0.04
data_A_comp <- simulate_A_matrix_acyclic(N, C=connectivity, sigma)
system.time(data_x_comp <- simulate_x_data_Julia(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
data_x_comp1<- remove_zero_data(data_x_comp)
data_A_comp_1 <- A_matrix_to_Adj(data_A_comp = data_A_comp)
latent_variables_comp <- simulate_latent_variables_comp(N,p=0)
true_pag_comp <- A_comp_to_pag_comp(data_A_comp = data_A_comp_1,latent_variables_comp = latent_variables_comp)
saveRDS(data_A_comp, file = "~/Microbial_causal_inference/scalability/ScaleGLV50_DataA.RDS")
saveRDS(data_x_comp, file = "~/Microbial_causal_inference/scalability/ScaleGLV50_Datax.RDS")
saveRDS(true_pag_comp, file = "~/Microbial_causal_inference/scalability/ScaleGLV50_truePAG.RDS")

long_string <- "this
is 
a 
long
string
with
whitespace"



#simulate n=5 c=0.3 cases for Holling and store it as Microbial_causal_inference/scalability/ScaleHolling5_...
N <- 5
sigma <- 1.2
theta_max <- 0.1
number_datapoints <- 1000
alpha <- 0.01
connectivity <- 0.3
data_A_comp <- simulate_A_matrix_acyclic(N, C=connectivity, sigma)
system.time(data_x_comp <- simulate_x_data_Julia(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
data_x_comp1<- remove_zero_data(data_x_comp)
data_A_comp_1 <- A_matrix_to_Adj(data_A_comp = data_A_comp)
latent_variables_comp <- simulate_latent_variables_comp(N,p=0)
true_pag_comp <- A_comp_to_pag_comp(data_A_comp = data_A_comp_1,latent_variables_comp = latent_variables_comp)
saveRDS(data_A_comp, file = "~/Microbial_causal_inference/scalability/ScaleHolling5_DataA.RDS")
saveRDS(data_x_comp, file = "~/Microbial_causal_inference/scalability/ScaleHolling5_Datax.RDS")
saveRDS(true_pag_comp, file = "~/Microbial_causal_inference/scalability/ScaleHolling5_truePAG.RDS")


#simulate n=10 c=0.2 cases for Holling and store it as Microbial_causal_inference/scalability/ScaleHolling10_...
N <- 10
sigma <- 1.2
theta_max <- 0.1
number_datapoints <- 1000
alpha <- 0.01
connectivity <- 0.2
data_A_comp <- simulate_A_matrix_acyclic(N, C=connectivity, sigma)
system.time(data_x_comp <- simulate_x_data_Julia(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
data_x_comp1<- remove_zero_data(data_x_comp)
data_A_comp_1 <- A_matrix_to_Adj(data_A_comp = data_A_comp)
latent_variables_comp <- simulate_latent_variables_comp(N,p=0)
true_pag_comp <- A_comp_to_pag_comp(data_A_comp = data_A_comp_1,latent_variables_comp = latent_variables_comp)
saveRDS(data_A_comp, file = "~/Microbial_causal_inference/scalability/ScaleHolling10_DataA.RDS")
saveRDS(data_x_comp, file = "~/Microbial_causal_inference/scalability/ScaleHolling10_Datax.RDS")
saveRDS(true_pag_comp, file = "~/Microbial_causal_inference/scalability/ScaleHolling10_truePAG.RDS")


#simulate n=20 c=0.1 cases for Holling and store it as Microbial_causal_inference/scalability/ScaleHolling20_...
N <- 20
sigma <- 1.2
theta_max <- 0.1
number_datapoints <- 1000
alpha <- 0.01
connectivity <- 0.1
data_A_comp <- simulate_A_matrix_acyclic(N, C=connectivity, sigma)
system.time(data_x_comp <- simulate_x_data_Julia(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
data_x_comp1<- remove_zero_data(data_x_comp)
data_A_comp_1 <- A_matrix_to_Adj(data_A_comp = data_A_comp)
latent_variables_comp <- simulate_latent_variables_comp(N,p=0)
true_pag_comp <- A_comp_to_pag_comp(data_A_comp = data_A_comp_1,latent_variables_comp = latent_variables_comp)
saveRDS(data_A_comp, file = "~/Microbial_causal_inference/scalability/ScaleHolling20_DataA.RDS")
saveRDS(data_x_comp, file = "~/Microbial_causal_inference/scalability/ScaleHolling20_Datax.RDS")
saveRDS(true_pag_comp, file = "~/Microbial_causal_inference/scalability/ScaleHolling20_truePAG.RDS")

#simulate n=50 c=0.04 cases for Holling and store it as Microbial_causal_inference/scalability/ScaleHolling50_...
N <- 50
sigma <- 1.2
theta_max <- 0.1
number_datapoints <- 1000
alpha <- 0.01
connectivity <- 0.04
data_A_comp <- simulate_A_matrix_acyclic(N, C=connectivity, sigma)
system.time(data_x_comp <- simulate_x_data_Julia(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
data_x_comp1<- remove_zero_data(data_x_comp)
data_A_comp_1 <- A_matrix_to_Adj(data_A_comp = data_A_comp)
latent_variables_comp <- simulate_latent_variables_comp(N,p=0)
true_pag_comp <- A_comp_to_pag_comp(data_A_comp = data_A_comp_1,latent_variables_comp = latent_variables_comp)
saveRDS(data_A_comp, file = "~/Microbial_causal_inference/scalability/ScaleHolling50_DataA.RDS")
saveRDS(data_x_comp, file = "~/Microbial_causal_inference/scalability/ScaleHolling50_Datax.RDS")
saveRDS(true_pag_comp, file = "~/Microbial_causal_inference/scalability/ScaleHolling50_truePAG.RDS")



