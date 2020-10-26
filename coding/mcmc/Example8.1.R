#> source("c:/work/MCMCslides/spring02/programs/chap7/slice.txt",print.eval=TRUE)#
#This generates samples from exp(-sqrt(x))/2 with a slice samples#
f <- function(y)exp(-sqrt(y))/2;
nsim<-50000;x<-array(0,dim=c(nsim,1));x[1]<--log(runif(1));
for (i in 2:nsim)  {
w<-runif(1,min=0,max=f(x[i-1]));x[i]<-runif(1,min=0,max=(-log(2*w))^2);
}
hist(x,main="Slice sample",xlim=c(0,60),ylim=c(0,.25),freq=F,col="green",breaks=250)
par(new=T)
plot(function(y)f(y), 0, 70, xlim=c(0,60),ylim=c(0,.25),xlab="",ylab="",xaxt="n",yaxt="n",lwd=3)
