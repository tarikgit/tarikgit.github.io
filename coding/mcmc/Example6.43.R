#> source("c:/workhome03/MCSM2/GCPrograms/chap5/ARwalk1.txt",print.eval=TRUE)#
#This a picture of a random walk#
#recurrent for b<1 and transient for b>1#
nsim<-1000;
par(mfrow=c(2,2))
#---------------------------------------------------------
b<-.4;std<-1/sqrt(1-b^2);
x<-0;y<-0;d<-20;
for(i in 1:nsim){x<-c(x,b*x[[i]]+rnorm(1))}
for(i in 1:nsim){y<-c(y,b*y[[i]]+rnorm(1))}
plot(x,y,type="l",xlim=c(-3*std,3*std),ylim=c(-3*std,3*std),lwd=2,xlab="theta=.4")
#---------------------------------------------------------
b<-.8;std<-1/sqrt(1-b^2)
x<-0;y<-0;d<-20;
for(i in 1:nsim){x<-c(x,b*x[[i]]+rnorm(1))}
for(i in 1:nsim){y<-c(y,b*y[[i]]+rnorm(1))}
plot(x,y,type="l",xlim=c(-3*std,3*std),ylim=c(-3*std,3*std),lwd=2,xlab="theta=.8")
#---------------------------------------------------------
b<-.99;std<-1/sqrt(1-b^2)
x<-0;y<-0;d<-20;
for(i in 1:nsim){x<-c(x,b*x[[i]]+rnorm(1))}
for(i in 1:nsim){y<-c(y,b*y[[i]]+rnorm(1))}
plot(x,y,type="l",xlim=c(-3*std,3*std),ylim=c(-3*std,3*std),lwd=2,xlab="theta=.95")
#---------------------------------------------------------
b<-1.0001;x<-0;y<-0;d<-20;
for(i in 1:nsim){x<-c(x,b*x[[i]]+rnorm(1))}
for(i in 1:nsim){y<-c(y,b*y[[i]]+rnorm(1))}
plot(x,y,type="l",xlim=c(-d,d),ylim=c(-d,d),lwd=2,xlab="theta=.1.0001")
#---------------------------------------------------------

