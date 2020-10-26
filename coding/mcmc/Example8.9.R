# Study of the d dimensional poor slice
# sampler of Rosenthal & Roberts
library(ts)
par(mfrow=c(4,2))
for (d in c(1,5,10,50)){
  D_1/d
  x_rep(0,1000)
  x[1]_runif(1)
  for (i in 2:1000){
  x[i]_runif(1)*(-log(runif(1)*exp(-x[i-1]^D)))^d
  }
  x_x^D
  plot(x,type="l",xlab="t",ylab="u")
  acf(x,main=paste("dimension",d,sep=" "))
}
