library(ggplot2)
data(list=esoph)

barplot(xtabs(esoph$ncases~esoph$tobg+esoph$alcgp),beside=TRUE,col=rainbow(4),
        main="Number of Cancer cases by Alcohol and Tobacco Use Groups",xlab="Alcohol Use Group",ylab="Cases")
legend("topright",legend=levels(esoph$tobgp),fill=rainbow(4),title="Tobacco Use Group")
ggplot(esoph,aes(x=alcgp,y=ncases,fill=tobgp))+
  geom_bar(position="dodge",stat="identity")+
  labs(fill="Tobacco Use Group",x="Acohol Use Group",y="Cases",title="Number of Cancer cases by Alcohol and Tobacco Use Groups")

EUst <- EuStockMarkets
plot(EUst[,1],ylab="Euros",main="German and Swiss Stock Time Series Comparison")
lines(EUst[,2],col="Blue")
legend("topleft",legend=c("German","Swiss"),col=c("Black","Blue"),lty=1)

df <- data.frame(Year = as.double(time(EUst)),German= as.double(EUst[,1]),Swiss = as.double(EUst[,2]))
ggplot(df,aes(x=Year))+
  geom_line(aes(y=df$Swiss,col="Swiss"))+
  geom_line(aes(y=df$German,col="German"))+
  labs(color="",y="Euros",title="German and Swiss Stock Time Series Comparison")

iris <- iris
wssplot <- function(data, nc=15, seed=1234){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)}
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")}
fit <- kmeans(iris[,1:4], 3)
iris$Cluster <- fit$cluster
par(mfrow=c(1,2))
plot(iris$Sepal.Length,iris$Sepal.Width,col=iris$Cluster,pch=16,xlab="Sepal Length",ylab="Sepal Width",
     main="Iris Data Colored by Cluster")
legend("topright",legend=c(1:3),col=c(1:3),pch=16)
plot(iris$Sepal.Length,iris$Sepal.Width,col=iris$Species,pch=16,xlab="Sepal Length",ylab="Sepal Width",
     main="Iris Data Colored by Species")
legend("topright",legend=levels(iris$Species),col=c(1:3),pch=16)
par(mfrow=c(1,1))
ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width))+
  geom_point(aes(colour=Species))+
  facet_grid(Cluster~.)+
  labs(x="Sepal Length",y="Sepal Width",title="Iris Species-Cluster Relationship")


