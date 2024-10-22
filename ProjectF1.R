set.seed(1)
install.packages("mclust")
install.packages("ggplot2")
library(mclust)

library(ggplot2)
K=seq(2,20,1)
AIC=numeric()
BIC=numeric()


?mclust

for(i in K){
  kmeans_model=Mclust(dummy_data,centers=i)
  AIC=c(AIC,AIC(kmeans_model))
  BIC=c(BIC,BIC(kmeans_model))
}

df=data.frame(Components = K, AIC = AIC, BIC = BIC)
ggplot(df, aes(x = Components)) +
  geom_line(aes(y = AIC, color = "AIC")) +
  geom_line(aes(y = BIC, color = "BIC")) +
  labs(title = "AIC and BIC for Different Numbers of Components",
       x = "Number of Components",
       y = "AIC / BIC") +
  scale_color_manual(values = c("AIC" = "blue", "BIC" = "red")) +
  theme_minimal()

# Find the optimal number of components based on minimum AIC and BIC
optimal_components_aic=K[which.min(AIC)]
optimal_components_bic=K[which.min(BIC)]
View(df)

gmm_model=Mclust(dummy_data,G=45)

cluster_assignment=gmm_model$data
View(table(cluster_assignment))

densityMclust(dummy_data)
View(Train_Data)
View(cluster_assignment)
