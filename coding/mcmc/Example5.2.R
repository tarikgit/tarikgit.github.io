#simple monte carlo optimization#
par(mfrow=c(1,2))
#The function to be optimized
mci <- function(x){(cos(50*x)+sin(20*x))^2}
plot(function(x)mci(x), xlim=c(0,1),ylim=c(0,4),lwd=2)
optimize(mci, c(0, 1), tol = 0.0001, maximum=TRUE)
#The monte carlo maximum
nsim<-5000;u<-runif(nsim);
max(mci(u))
plot(u,mci(u))
#The "exact" value is 3.8325#
#Simulated annealing
#xval<-array(1,c(nsim,1));r<-.1
#for(i in 2:nsim){
#test<-runif(1, min=max(xval[i-1]-r,0),max=min(xval[i-1]+r,1));
#delta<-mci(test)-mci(xval[i-1]);
#rho<-min(exp(delta*log(i)/100),1);
#xval[i]<-test*(u[i]<rho)+xval[i-1]*(u[i]>rho);
#}
#plot(xval,type="l",ylim=c(0,1))
#par(new=T)
#plot(lowess(xval),type="l",ylim=c(0,1),xlab="",ylab="",col="red")
#plot(xval,mci(xval))
