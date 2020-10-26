# R program for the Example of Chapter 3 on Student's T
# distribution
h1_function(x){
sqrt(abs(x/(1-x)))
}

h2_function(x){
(x>2.1)*x^5
}

h3_function(x){
(x>0)*x^5/(1+(x-3)^2)
}

# Ranges of estimators for various importance functions

stu_matrix(rt(500*2000,df=12),ncol=500)
nore_matrix(rnorm(500*2000,sd=sqrt(1.2)),ncol=500)
cauy_matrix(rcauchy(500*2000),ncol=500)
tgam_matrix((1+(1-2*(runif(500*2000)<.5))*rgamma(500*2000,.5)),ncol=500)

# h1
so1_apply(apply(h1(stu),2,cumsum)/(1:2000),1,range)
no1_apply(apply(h1(nore)*dt(nore,df=12)/dnorm(nore,sd=sqrt(1.2)),2,cumsum)/(1:2000),1,range)
co1_apply(apply(h1(cauy)*dt(cauy,df=12)/dcauchy(cauy),2,cumsum)/(1:2000),1,range)
go1_apply(apply(h1(tgam)*dt(tgam,df=12)*2/dgamma(abs(tgam-1),.5),2,cumsum)/(1:2000),1,range)

#Plots
par(mfrow=c(1,3),mar=c(2,2,1,1))
# Student
temp_apply(apply(h1(stu),2,cumsum)/1:2000,1,mean)
plot(temp,lwd=2,col="sienna3",xlab="iterations",ylab="",type="l",ylim=c(0,3))
polygon(c(1:2000,2000:1),c(so1[1,],so1[2,2000:1]),col="gray91")
lines(temp,lwd=2,col="sienna3")
# Normal
temp_apply(apply(h1(nore)*dt(nore,df=12)/dnorm(nore,sd=sqrt(1.2)),2,cumsum)/1:2000,1,mean)
plot(temp,lwd=2,col="sienna3",xlab="iterations",ylab="",type="l",ylim=c(0,3))
polygon(c(1:2000,2000:1),c(no1[1,],no1[2,2000:1]),col="gray91")
lines(temp,lwd=2,col="sienna3")
# Cauchy
temp_apply(apply(h1(cauy)*dt(cauy,df=12)/dcauchy(cauy),2,cumsum)/1:2000,1,mean)
plot(temp,lwd=2,col="sienna3",xlab="iterations",ylab="",type="l",ylim=c(0,3))
polygon(c(1:2000,2000:1),c(co1[1,],co1[2,2000:1]),col="gray91")
lines(temp,lwd=2,col="sienna3")

X11()
# Double gamma
temp_apply(apply(2*h1(tgam)*dt(tgam,df=12)/dgamma(abs(tgam-1),.5),2,cumsum)/1:2000,1,mean)
plot(temp,lwd=2,col="sienna3",xlab="iterations",ylab="",type="l",ylim=c(0,3))
polygon(c(1:2000,2000:1),c(go1[1,],go1[2,2000:1]),col="gray91")
lines(temp,lwd=2,col="sienna3")

rm(stu,nore,cauy,tgam,so1,no1,co1,go1,temp,h1,h2,h3)
