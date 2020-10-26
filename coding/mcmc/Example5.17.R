#This does the em algorithm for censored data#
#n obs normal(t0,1), m uncensored values, n-m censored at a#
n<-25;a<-4.5;theta0<-4;nt<-50
#data generated from normal(4,1)
xdata<-c(4.238536, 6.078472, 2.917910, 5.607990, 6.117035, 3.509471, 4.082299, 4.097428, 
2.964908, 3.010554, 2.943618, 2.913119, 5.867795, 5.561251, 4.075173, 4.554778, 2.214987, 
4.096038, 3.776454, 5.273564, 4.061973, 3.996325, 3.530475, 3.552799, 3.978461)
par(mfrow=c(1,2))
#******************Makes Likelihood picture*************************************
ydata<- sort(xdata*(xdata<a)+a*(xdata>a));m<- sum(xdata<a);
theta <- seq(theta0-2,theta0+2,length=100)
cdlike<-function(x,mu.val=0,sd.val=1)prod(dnorm(x,mu.val,1))
cdlike.vec <- NULL;obslike.vec<-NULL;
for (i in 1:length(theta)) cdlike.vec[i] <- cdlike(xdata,theta[i],sd=1)
obslike<-function(x,mu.val=0,sd.val=1)prod(dnorm(ydata[1:m],mu.val,1))*prod(pnorm( 
ydata[(m+1):n],mu.val,1))
for (i in 1:length(theta)) obslike.vec[i] <- obslike(xdata,theta[i],sd=1)
plot(theta,obslike.vec,type="l",lwd=2,lty=2,ylab="Likelihood",xlab="Theta")
par(new=T)
plot(theta,cdlike.vec,type="l",xlab="",ylab="",xaxt="n",yaxt="n",lwd=2)
#******************Calculates MLE*******************************************
#ydata<- sort(xdata*(xdata<a)+a*(xdata>a));
m<- sum(xdata<a)
temp<-xdata*(xdata<a);temp<-temp[temp!=0]
xbar<-mean(temp)
that<-array(xbar,dim=c(nt,1));
for (j in 2:nt)  {
that[j] <-(m/n)*xbar+(1-m/n)*(that[j-1]+dnorm(a-that[j-1])/(1-pnorm(a-that[j-1])))
}
#now do MCEM, z=missing data, nz=size of MC sample
tmc<-array(xbar,dim=c(nt,1));nz<-25;
for (j in 2:nt)  {
z<-array(a-1,dim=c(nz,1));
for (k in 1:nz)  {while(z[k] <a) z[k] <- rnorm(1,mean=tmc[j-1],sd=1)}
zbar<-mean(z)
tmc[j] <-(m/n)*xbar+(1-m/n)*zbar
}
plot(that,type="l",xlim=c(0,nt),ylim=c(3.5,4.5),lwd=2,xlab="Iteration",ylab="EM Estimate",lty=2)
par(new=T)
plot(tmc,type="l",xlim=c(0,nt),ylim=c(3.5,4.5),xlab="",ylab="",xaxt="n",yaxt="n",lwd=2,lty=1)
