#This shows complete data and censored data likelihood for normal#
#generate data - x is complete, y is incomplete#
n<-25;a<-4.5;theta0<-4;
#xdata<-rnorm(n,mean=theta0,sd=1);
xdata<-c(4.238536, 6.078472, 2.917910, 5.607990, 6.117035, 3.509471, 4.082299, 4.097428, 2.964908, 3.010554, 2.943618, 2.913119, 5.867795, 5.561251, 4.075173, 4.554778, 2.214987, 4.096038, 3.776454, 5.273564, 4.061973, 3.996325, 3.530475, 3.552799, 3.978461)
ydata<- sort(xdata*(xdata<a)+a*(xdata>a));m<- sum(xdata<a);
theta <- seq(theta0-2,theta0+2,length=100)
cdlike<-function(x,mu.val=0,sd.val=1)prod(dnorm(x,mu.val,1))
cdlike.vec <- NULL;obslike.vec<-NULL;
for (i in 1:length(theta)) cdlike.vec[i] <- cdlike(xdata,theta[i],sd=1)
obslike<-function(x,mu.val=0,sd.val=1)prod(dnorm(ydata[1:m],mu.val,1))*prod(pnorm( ydata[(m+1):n],mu.val,1))
for (i in 1:length(theta)) obslike.vec[i] <- obslike(xdata,theta[i],sd=1)
plot(theta,obslike.vec,type="l",lwd=2,lty=2,ylab="Likelihood")
par(new=T)
plot(theta,cdlike.vec,type="l",xlab="",ylab="",xaxt="n",yaxt="n",lwd=2)
