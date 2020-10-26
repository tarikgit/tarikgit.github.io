#This a picture of AR convergence#
#recurrent for b<1 and transient for b>1#
par(mfrow=c(1,2))
b<-.5;nsim<-1000;x<-0;den<-1:(nsim+1);
for(i in 1:nsim){x<-c(x,b*x[[i]]+rnorm(1))}
meanx<-cumsum(x)/den;
stdx<-sqrt( cumsum(x^2)/den - (meanx)^2)
plot(meanx,type="l",lty=1,lwd=2,ylim=c(-1,2),xlab="iteration",ylab="mean and std",col="black")
par(new=T)
plot(stdx,type="l",lty=2,lwd=2,ylim=c(-1,2),xlab="",ylab="",xaxt="n",yaxt="n",col="black")
#******************************************************************************
b<-1.0001;nsim<-1000;x<-0;den<-1:(nsim+1);
for(i in 1:nsim){x<-c(x,b*x[[i]]+rnorm(1))}
meanx<-cumsum(x)/den;
stdx<-sqrt( cumsum(x^2)/den - (meanx)^2)
plot(meanx,type="l",lty=1,lwd=2,xlab="iteration",ylab="mean and std",col="black")
par(new=T)
plot(stdx,type="l",lty=2,lwd=2,xlab="",ylab="",xaxt="n",yaxt="n",col="black")
