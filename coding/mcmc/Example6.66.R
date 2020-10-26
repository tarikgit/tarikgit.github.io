#This a picture of th AR means#
#recurrent for b<1 and transient for b>1#
#nsim = number of means, n = obs in each mean# 
b<-.5;std<-sqrt(1/(1-b^2));nsim<-2500;n<-50;meanx<-0;varx<-1;
x<-array(0,c(n,1));meanx<-array(0,c(nsim,1))
for(j in 1:nsim){
x[1]<-rnorm(1,mean=0,sd=std);
for(i in 2:n) {x[i]<-b*x[i-1]+rnorm(1)}
#vx<-x[1]^2+2*mean(((x[1])*(x[2:n]-mean(x)))^2) 
meanx[j]<-mean(x)
#varx<-c(varx,vx)
}
par(mfrow=c(1,2))
hist(meanx/sd(meanx),freq=FALSE,xlim=c(-4,4),ylim=c(0,.45),col="green",main="",xlab="")
par(new=T)
plot(function(x)dnorm(x,mean=0, sd=1),xlim=c(-4,4),ylim=c(0,.45),xlab="",ylab="",xaxt="n",yaxt="n")
#****************************************************************************************************
b<-2;
for(j in 1:nsim){
x[1]<-rnorm(1,mean=0,sd=std);
for(i in 2:n) {x[i]<-b*x[i-1]+rnorm(1)}
#vx<-x[1]^2+2*mean(((x[1])*(x[2:n]-mean(x)))^2) 
meanx[j]<-mean(x)
#varx<-c(varx,vx)
}
hist(meanx/sd(meanx),freq=FALSE,xlim=c(-4,4),ylim=c(0,.45),col="green",main="",xlab="")
par(new=T)
plot(function(x)dnorm(x,mean=0, sd=1),xlim=c(-4,4),ylim=c(0,.45),xlab="",ylab="",xaxt="n",yaxt="n")
