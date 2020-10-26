# Pintail capture recapture example in Chapter 2

pint_scan("pintail.data")
# conditionals
par(mfrow=c(3,3),mar=c(4,4,1,1))
alfas_seq(-10,-3,.01)
years_seq(1957,1968,1)
for (i in 1:9){
 post_exp(alfas*pint[i]-0.5*(alfas/10)^2)/(1+exp(alfas))^1612
 post_post/max(post)
 plot(alfas,post,type="l",col="sienna4",lwd=2,xlab="",ylab="",main=years[i])
 }
#dev.copy(postscript,"pintail1.eps");dev.off()

#ARS simulation for 1960 aka i=4

#goal log function
h_function(x){
(x*pint[4]-0.5*(x/10)^2)-1612*log(1+exp(x))
}

#-------------Begin the Simulation of g
xbot<--8;
xtop<--4;
steps<-.1			
x<-c(seq(xbot,xtop, by=steps))			#starting points
nx<-length(x)
a<-array(0,c((nx-1),1)) 		        #arrays for the slope and intercept
b<-array(0,c((nx-1),1))	
w<-array(0,c((nx-1),1))			        #array for weights
for(i in 1:(nx-1)){
   b[i]<-(h(x[i+1])-h(x[i]))/(x[i+1]-x[i]);a[i]<-h(x[i])-(b[i]*x[i])
   }
for(i in 2:(nx-2)){
  temp<-(a[i-1]-a[i+1])/(b[i+1]-b[i])
  temp1<-(exp(a[i-1])/b[i-1])*(exp(temp*b[i-1])-exp(b[i-1]*x[i]))
  temp2<-(exp(a[i+1])/b[i+1])*(exp(b[i+1]*x[i+1])-exp(temp*b[i+1]))
  temp3<-(exp(a[i-1])/b[i-1])*(exp(x[i+1]*b[i-1])-exp(b[i-1]*x[i]))
  temp4<-(exp(a[i+1])/b[i+1])*(exp(b[i+1]*x[i+1])-exp(x[i]*b[i+1]))
  w[i]<-temp1+temp2
  if(temp<x[i])   w[i]<-temp3
  if(temp>x[i+1]) w[i]<-temp4
  }
# endpoints
w[1]<-(exp(a[2])/b[2])*(exp(b[2]*x[2])-exp(b[2]*x[1]))			
w[nx-1]<-(exp(a[nx-1])/b[nx-1])*(exp(b[nx-1]*x[nx])-exp(b[nx-1]*x[nx-1]))

#-----------------Generating from g----------
w<-w/sum(w)
nsim<-5000
xout<-array(0,c(nsim,1))
hout<-array(0,c(nsim,1))
selctd_sample(1:(nx-1),size=nsim,replace=T,prob=w)
xout<-x[selctd]+runif(nsim)*(x[selctd+1]-x[selctd])
hout<-h(xout)

#------------------Graphics-------------------
#plot(function(x)h(x))
X11()
ytop<-max(hist(xout,xlim=c(xbot,xtop),proba=T,nclass=100,plot=F)$density)
hist(xout,xlim=c(xbot,xtop),proba=T,nclass=100,col="lightgrey",xlab="",ylab="",main="1960")
alfas_seq(xbot,xtop,.01)
hays_exp(h(alfas))
hays_hays*ytop/max(hays)
lines(alfas,hays,lwd=2,col="orangered")
dev.copy(postscript,"pintail2.eps");dev.off()

