#Newton Raphson Example for Chapter 1
par(mfrow=c(2,2))
#*******************Finding Square Root*****************************************
NR<-function(x){x^2-b}
NR1<-function(x){2*x}
nsim<-10;b<-5;
xval<-array(0,c(nsim,1))
NRval<-array(0,c(nsim,1))
xval[1]<-4
for(i in 2:nsim){xval[i]<-xval[i-1]-(NR(xval[i-1])/NR1(xval[i-1]))}
plot(function(x)NR(x),xlim=c(0,b),ylim=c(-b,b),lwd=2,xlab="f(x)",ylab="")
par(new=T);lines(x=c(0,5),y=c(sqrt(b),sqrt(b)),lwd=2,lty=2)
bot<--5;top<-25
plot(c(1:nsim),NR(xval),ylim=c(bot,top),type="l",lwd=2,xlab="values of f(x)",ylab="")
xval[1]<-2
for(i in 2:nsim){xval[i]<-xval[i-1]-(NR(xval[i-1])/NR1(xval[i-1]))}
par(new=T);plot(c(1:nsim),NR(xval),ylim=c(bot,top),type="l",lwd=2,lty=2,xlab="",ylab="")
xval[1]<-.5
for(i in 2:nsim){xval[i]<-xval[i-1]-(NR(xval[i-1])/NR1(xval[i-1]))}
par(new=T);plot(c(1:nsim),NR(xval),ylim=c(bot,top),type="l",lwd=2,lty=4,,xlab="",ylab="")
#******************Harder function**********************************************
mci <- function(x){(cos(50*x)+sin(20*x))^2}
mci1<-function(x){2*(cos(50*x) + sin(20*x))*(20*cos(20*x) - 50*sin(50*x))}
mci2<-function(x){100*(8*cos(40*x) - 50*cos(100*x) + 9*sin(30*x) - 49*sin(70*x))}
plot(function(x)mci(x), xlim=c(0,1),ylim=c(0,4),lwd=2,xlab="h(x)",ylab="")
nsim<-200
xval1<-array(0,c(nsim,1));xval2<-xval1;xval3<-xval2
xval1[1]<-.75
for(i in 2:nsim){xval1[i]<-xval1[i-1]-(mci1(xval1[i-1])/mci2(xval1[i-1]));if(xval1[i]<0)xval1[i]<-runif(1)}
xval2[1]<-0.3791249#This is where the max is
for(i in 2:nsim){xval2[i]<-xval2[i-1]-(mci1(xval2[i-1])/mci2(xval2[i-1]));if(xval2[i]<0)xval2[i]<-runif(1)}
xval3[1]<-.25
for(i in 2:nsim){xval3[i]<-xval3[i-1]-(mci1(xval3[i-1])/mci2(xval3[i-1]));if(xval3[i]<0)xval3[i]<-runif(1)}
lower<-min(cbind(xval1,xval2,xval3));upper<-max(cbind(xval1,xval2,xval3));
lower<--1;upper<-5
plot(c(1:nsim),mci(xval1),ylim=c(lower,upper),type="l",lwd=2,xlab="values of h'(x)",ylab="")
par(new=t);plot(c(1:nsim),mci(xval2),type="l",lwd=2,lty=4,ylim=c(lower,upper),xlab="",ylab="")
par(new=t);plot(c(1:nsim),mci(xval3),type="l",lwd=2,lty=2,ylim=c(lower,upper),xlab="",ylab="")
