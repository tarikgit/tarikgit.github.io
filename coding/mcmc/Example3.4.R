#> source("c:/WorkHome03/MCSM2/GCprograms/Chap3/SimpleMCI.txt",print.eval=TRUE)#
#This gives a simple monte carlo integration#
nsim<-10000;u<-runif(nsim);
den<-1:(nsim)
#The function to be integrated
mci.ex <- function(x){(cos(50*x)+sin(20*x))^2}
par(mfrow=c(1,3))
plot(function(x)mci.ex(x), xlim=c(0,1),ylim=c(0,4),xlab="Function",ylab="")
#The monte carlo sum
hint<-mci.ex(u)
hplot<-cumsum(hint)/den
stdh<-sqrt( cumsum(hint^2)/den - (hplot)^2)
par(new=F)
hist(hint,xlab="Generated Values of Function",freq=F,col="green",breaks=30,ylab="",main="")
par(new=F)
plot(hplot,type="l",col="red",xlab="Mean and Standard Errors",ylab="",xlim=c(1,nsim),ylim=c(.9,1.1))
par(new=T)
plot(hplot+stdh/sqrt(den),type="l",col="green",xlab="",ylab="",xlim=c(1,nsim),ylim=c(.9,1.1),lty=2)
par(new=T)
plot(hplot-stdh/sqrt(den),type="l",col="green",xlab="",ylab="",xlim=c(1,nsim),ylim=c(.9,1.1),lty=2)
