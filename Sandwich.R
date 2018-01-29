library(sandwich)
library(lmtest)
xs <- rnorm(1000,10,2)
ys <- xs*2
X <- cbind(1,xs)
plot(ys~xs)
ys <- ys +  xs * rnorm(1000,1,1)
plot(ys~xs)
mod <- lm(ys~xs)
summary(mod)
ehat <- diag(residuals(mod)^2)
sqrt(diag(solve(t(X)%*%X) %*% t(X) %*% ehat %*% X %*% solve(t(X)%*%X)))
coeftest(mod, vcov = sandwich)


