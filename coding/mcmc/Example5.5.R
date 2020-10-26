#simulated annealing algorithm for simple example
par(mfrow=c(1,2))
#The function to be optimized
mci <- function(x){(cos(50*x)+sin(20*x))^2}
plot(function(x)mci(x), xlim=c(0,1),ylim=c(0,4),lwd=2)
#optimize(mci, c(0, 1), tol = 0.0001, maximum=TRUE)
#The monte carlo maximum
nsim<-2500
u<-runif(nsim)
#Simulated annealing
xval<-array(0,c(nsim,1));r<-.5
for(i in 2:nsim){
test<-runif(1, min=max(xval[i-1]-r,0),max=min(xval[i-1]+r,1));
delta<-mci(test)-mci(xval[i-1]);
rho<-min(exp(delta*log(i)/1),1);
xval[i]<-test*(u[i]<rho)+xval[i-1]*(u[i]>rho)
}
mci(xval[nsim])
plot(xval,mci(xval),type="l",lwd=2)
 
