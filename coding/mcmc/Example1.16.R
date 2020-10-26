#This simulates from the challenger posterior distribution#
#We use an exponential prior on w=exp(a) - this guarantees propriety
#This makes the picture for Chapter 1
y<-c(1,1,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,1,0,0,0,0,0)
x<-c(53,57,58,63,66,67,67,67,68,69,70,70,70,70,72,73,75,75,76,76,78,79,81)
n<-length(y);
nsim<-10000
ahat<-array(0,dim=c(nsim,1));bhat<-array(0,dim=c(nsim,1));
#log likelihood,candidate  densities, centered at MLEs#
loglike <- function(a,b){sum(y*(a+b*x)-log(1+exp(a+b*x)))}
dcand<-function(b)dnorm(b,-0.2322,0.1081,log=TRUE)
ahat[1]<-15.0429;bhat[1]<--0.2322;
Lbeta<-15.0429+.577216
for (j in 2:nsim)  {
acand<-Lbeta+log(rexp(1));bcand<-rnorm(1,-0.2322,0.1081)
test<-min(exp(loglike(acand,bcand)-loglike(ahat[j-1],bhat[j-1])+dcand(bhat[j-1])-dcand(bcand)),1);
rho<-(runif(1)<test);
ahat[j]<-acand*rho+ahat[j-1]*(1-rho);
bhat[j]<-bcand*rho+bhat[j-1]*(1-rho);
}
#par(mfrow=c(1,3),mar=rep(.1,4))

#hist(ahat,xlab="Intercept",freq=FALSE,col="green",breaks=50,main="")
#par(new=F)
#hist(bhat,xlab="Slope",freq=FALSE,col="green",breaks=50,main="")
#par(new=F)
par(mfrow=c(1,3))
for(i in 7500:nsim)
{
plot(function(x)phat(ahat[i],bhat[i],x), xlab="",xlim=c(25,95),ylim=c(0,1),ylab="",lty=3,col="gray")
par(new=T)
}
plot(function(x)phat(mean(ahat),mean(bhat),x), xlim=c(25,95),ylim=c(0,1),ylab="",lwd=2.5)
#These are the failure probabilities
phat <- function(a,b,x)exp(a+b*x)/(1+exp(a+b*x))
probplot1<-phat(ahat,bhat,65)
probplot2<-phat(ahat,bhat,45)
par(new=F)
hist(probplot1,xlab="",col="green",freq=FALSE,main="",xlim=c(.2,.8))
par(new=F)
hist(probplot2,xlab="",col="green",freq=FALSE,main="",xlim=c(.9,1))
