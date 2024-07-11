# sample size analysis 
# n=20 c=0.1
# sigma = 1.2
# GLV thetamax = 0 Holling thetamax = 0.1
# no of data: 50/200/500/1000/2000
N <- 20
sigma <- 1.2
connectivity <- 0.1

#simulate 50 samples cases for GLV and store it as Microbial_causal_inference/samplesize/GLV_50...
theta_max <- 0
number_datapoints <- 50
data_A_comp <- simulate_A_matrix_acyclic(N, C=connectivity, sigma)
system.time(data_x_comp <- simulate_x_data_Julia(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
data_x_comp1<- remove_zero_data(data_x_comp)
data_A_comp_1 <- A_matrix_to_Adj(data_A_comp = data_A_comp)
latent_variables_comp <- simulate_latent_variables_comp(N,p=0)
true_pag_comp <- A_comp_to_pag_comp(data_A_comp = data_A_comp_1,latent_variables_comp = latent_variables_comp)
saveRDS(data_A_comp, file = "~/Microbial_causal_inference/samplesize/GLV_50_DataA.RDS")
saveRDS(data_x_comp, file = "~/Microbial_causal_inference/samplesize/GLV_50_Datax.RDS")
saveRDS(true_pag_comp, file = "~/Microbial_causal_inference/samplesize/GLV_50_truePAG.RDS")


#simulate 200 samples cases for GLV and store it as Microbial_causal_inference/samplesize/GLV_200...
theta_max <- 0
number_datapoints <- 200
data_A_comp <- simulate_A_matrix_acyclic(N, C=connectivity, sigma)
system.time(data_x_comp <- simulate_x_data_Julia(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
data_x_comp1<- remove_zero_data(data_x_comp)
data_A_comp_1 <- A_matrix_to_Adj(data_A_comp = data_A_comp)
latent_variables_comp <- simulate_latent_variables_comp(N,p=0)
true_pag_comp <- A_comp_to_pag_comp(data_A_comp = data_A_comp_1,latent_variables_comp = latent_variables_comp)
saveRDS(data_A_comp, file = "~/Microbial_causal_inference/samplesize/GLV_200_DataA.RDS")
saveRDS(data_x_comp, file = "~/Microbial_causal_inference/samplesize/GLV_200_Datax.RDS")
saveRDS(true_pag_comp, file = "~/Microbial_causal_inference/samplesize/GLV_200_truePAG.RDS")


#simulate 500 samples cases for GLV and store it as Microbial_causal_inference/samplesize/GLV_500...
theta_max <- 0
number_datapoints <- 500
data_A_comp <- simulate_A_matrix_acyclic(N, C=connectivity, sigma)
system.time(data_x_comp <- simulate_x_data_Julia(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
data_x_comp1<- remove_zero_data(data_x_comp)
data_A_comp_1 <- A_matrix_to_Adj(data_A_comp = data_A_comp)
latent_variables_comp <- simulate_latent_variables_comp(N,p=0)
true_pag_comp <- A_comp_to_pag_comp(data_A_comp = data_A_comp_1,latent_variables_comp = latent_variables_comp)
saveRDS(data_A_comp, file = "~/Microbial_causal_inference/samplesize/GLV_500_DataA.RDS")
saveRDS(data_x_comp, file = "~/Microbial_causal_inference/samplesize/GLV_500_Datax.RDS")
saveRDS(true_pag_comp, file = "~/Microbial_causal_inference/samplesize/GLV_500_truePAG.RDS")

#simulate 1000 samples cases for GLV and store it as Microbial_causal_inference/samplesize/GLV_1000...
theta_max <- 0
number_datapoints <- 1000
data_A_comp <- simulate_A_matrix_acyclic(N, C=connectivity, sigma)
system.time(data_x_comp <- simulate_x_data_Julia(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
data_x_comp1<- remove_zero_data(data_x_comp)
data_A_comp_1 <- A_matrix_to_Adj(data_A_comp = data_A_comp)
latent_variables_comp <- simulate_latent_variables_comp(N,p=0)
true_pag_comp <- A_comp_to_pag_comp(data_A_comp = data_A_comp_1,latent_variables_comp = latent_variables_comp)
saveRDS(data_A_comp, file = "~/Microbial_causal_inference/samplesize/GLV_1000_DataA.RDS")
saveRDS(data_x_comp, file = "~/Microbial_causal_inference/samplesize/GLV_1000_Datax.RDS")
saveRDS(true_pag_comp, file = "~/Microbial_causal_inference/samplesize/GLV_1000_truePAG.RDS")

#simulate 2000 samples cases for GLV and store it as Microbial_causal_inference/samplesize/GLV_2000...
theta_max <- 0
number_datapoints <- 2000
data_A_comp <- simulate_A_matrix_acyclic(N, C=connectivity, sigma)
system.time(data_x_comp <- simulate_x_data_Julia(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
data_x_comp1<- remove_zero_data(data_x_comp)
data_A_comp_1 <- A_matrix_to_Adj(data_A_comp = data_A_comp)
latent_variables_comp <- simulate_latent_variables_comp(N,p=0)
true_pag_comp <- A_comp_to_pag_comp(data_A_comp = data_A_comp_1,latent_variables_comp = latent_variables_comp)
saveRDS(data_A_comp, file = "~/Microbial_causal_inference/samplesize/GLV_2000_DataA.RDS")
saveRDS(data_x_comp, file = "~/Microbial_causal_inference/samplesize/GLV_2000_Datax.RDS")
saveRDS(true_pag_comp, file = "~/Microbial_causal_inference/samplesize/GLV_2000_truePAG.RDS")













#simulate 50 samples cases for Holling and store it as Microbial_causal_inference/samplesize/Holling_50...
theta_max <- 0.1
number_datapoints <- 50
data_A_comp <- simulate_A_matrix_acyclic(N, C=connectivity, sigma)
system.time(data_x_comp <- simulate_x_data_Julia(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
data_x_comp1<- remove_zero_data(data_x_comp)
data_A_comp_1 <- A_matrix_to_Adj(data_A_comp = data_A_comp)
latent_variables_comp <- simulate_latent_variables_comp(N,p=0)
true_pag_comp <- A_comp_to_pag_comp(data_A_comp = data_A_comp_1,latent_variables_comp = latent_variables_comp)
saveRDS(data_A_comp, file = "~/Microbial_causal_inference/samplesize/Holling_50_DataA.RDS")
saveRDS(data_x_comp, file = "~/Microbial_causal_inference/samplesize/Holling_50_Datax.RDS")
saveRDS(true_pag_comp, file = "~/Microbial_causal_inference/samplesize/Holling_50_truePAG.RDS")


#simulate 200 samples cases for Holling and store it as Microbial_causal_inference/samplesize/Holling_200...
theta_max <- 0.1
number_datapoints <- 200
data_A_comp <- simulate_A_matrix_acyclic(N, C=connectivity, sigma)
system.time(data_x_comp <- simulate_x_data_Julia(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
data_x_comp1<- remove_zero_data(data_x_comp)
data_A_comp_1 <- A_matrix_to_Adj(data_A_comp = data_A_comp)
latent_variables_comp <- simulate_latent_variables_comp(N,p=0)
true_pag_comp <- A_comp_to_pag_comp(data_A_comp = data_A_comp_1,latent_variables_comp = latent_variables_comp)
saveRDS(data_A_comp, file = "~/Microbial_causal_inference/samplesize/Holling_200_DataA.RDS")
saveRDS(data_x_comp, file = "~/Microbial_causal_inference/samplesize/Holling_200_Datax.RDS")
saveRDS(true_pag_comp, file = "~/Microbial_causal_inference/samplesize/Holling_200_truePAG.RDS")


#simulate 500 samples cases for Holling and store it as Microbial_causal_inference/samplesize/Holling_500...
theta_max <- 0.1
number_datapoints <- 500
data_A_comp <- simulate_A_matrix_acyclic(N, C=connectivity, sigma)
system.time(data_x_comp <- simulate_x_data_Julia(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
data_x_comp1<- remove_zero_data(data_x_comp)
data_A_comp_1 <- A_matrix_to_Adj(data_A_comp = data_A_comp)
latent_variables_comp <- simulate_latent_variables_comp(N,p=0)
true_pag_comp <- A_comp_to_pag_comp(data_A_comp = data_A_comp_1,latent_variables_comp = latent_variables_comp)
saveRDS(data_A_comp, file = "~/Microbial_causal_inference/samplesize/Holling_500_DataA.RDS")
saveRDS(data_x_comp, file = "~/Microbial_causal_inference/samplesize/Holling_500_Datax.RDS")
saveRDS(true_pag_comp, file = "~/Microbial_causal_inference/samplesize/Holling_500_truePAG.RDS")

#simulate 1000 samples cases for Holling and store it as Microbial_causal_inference/samplesize/Holling_1000...
theta_max <- 0
number_datapoints <- 1000
data_A_comp <- simulate_A_matrix_acyclic(N, C=connectivity, sigma)
system.time(data_x_comp <- simulate_x_data_Julia(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
data_x_comp1<- remove_zero_data(data_x_comp)
data_A_comp_1 <- A_matrix_to_Adj(data_A_comp = data_A_comp)
latent_variables_comp <- simulate_latent_variables_comp(N,p=0)
true_pag_comp <- A_comp_to_pag_comp(data_A_comp = data_A_comp_1,latent_variables_comp = latent_variables_comp)
saveRDS(data_A_comp, file = "~/Microbial_causal_inference/samplesize/Holling_1000_DataA.RDS")
saveRDS(data_x_comp, file = "~/Microbial_causal_inference/samplesize/Holling_1000_Datax.RDS")
saveRDS(true_pag_comp, file = "~/Microbial_causal_inference/samplesize/Holling_1000_truePAG.RDS")

#simulate 2000 samples cases for Holling and store it as Microbial_causal_inference/samplesize/Holling_2000...
theta_max <- 0.1
number_datapoints <- 2000
data_A_comp <- simulate_A_matrix_acyclic(N, C=connectivity, sigma)
system.time(data_x_comp <- simulate_x_data_Julia(N, theta_max, number_datapoints, data_A_comp = data_A_comp))
data_x_comp1<- remove_zero_data(data_x_comp)
data_A_comp_1 <- A_matrix_to_Adj(data_A_comp = data_A_comp)
latent_variables_comp <- simulate_latent_variables_comp(N,p=0)
true_pag_comp <- A_comp_to_pag_comp(data_A_comp = data_A_comp_1,latent_variables_comp = latent_variables_comp)
saveRDS(data_A_comp, file = "~/Microbial_causal_inference/samplesize/Holling_2000_DataA.RDS")
saveRDS(data_x_comp, file = "~/Microbial_causal_inference/samplesize/Holling_2000_Datax.RDS")
saveRDS(true_pag_comp, file = "~/Microbial_causal_inference/samplesize/Holling_2000_truePAG.RDS")