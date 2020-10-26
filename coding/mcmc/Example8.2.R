# Sample from a N(-3,1) truncated to [0,1]
# using the slice sampler
xes_seq(0,1,.01)
xes_c(xes,1-xes)
yes_c(exp(-(seq(0,1,.01)+3)^2/2),0*seq(0,1,.01))
plot(xes[1:101],yes[1:101],type="l",lwd=2,col="sienna3",xlab="x",ylab=expression(f(x)))
polygon(xes,yes,col="gold")
# 
# Function delay, to check points
delay_function(n){
for (j in 1:(n*1000)) x_log(4)^3
}
# Generation of the slice sampler sequence
#
obs_matrix(0,ncol=2,nrow=100)
obs[1,1]_.25
obs[1,2]_0.5*exp(-0.5*(obs[1,1]+3)^2)
points(obs[1,1],obs[1,2],col="sienna4",pch=20)
for (i in 2:100){
 obs[i,2]_exp(-0.5*(obs[i-1,1]+3)^2)*runif(1)
 obs[i,1]_runif(1)*min(1,-3+sqrt(-2*log(obs[i,2])))
 }
#  Plot of the slice sampling steps
#
for (i in 2:10){
  if (i>2) points(obs[i-1,1],obs[i-1,2],col="steelblue3",pch=20)
  #delay(20)
  lines(c(obs[i-1,1],obs[i-1,1]),c(obs[i-1,2],obs[i,2]),col="steelblue3")
  points(obs[i-1,1],obs[i,2],col="steelblue3",pch=20)
  #delay(20)
  #points(obs[i-1,1],obs[i-1,2],col="gold",pch=20)
  #lines(c(obs[i-1,1],obs[i-1,1]),c(obs[i-1,2],obs[i,2]),col="gold")
  #delay(20)
  lines(c(obs[i-1,1],obs[i,1]),c(obs[i,2],obs[i,2]),col="steelblue3")
  points(obs[i,1],obs[i,2],col="steelblue3",pch=20)
  #points(obs[i-1,1],obs[i,2],col="gold",pch=20)
  #delay(20)
  #lines(c(obs[i-1,1],obs[i,1]),c(obs[i,2],obs[i,2]),col="gold")
  #points(obs[i,1],obs[i,2],col="gold",pch=20)
  }
# Three plots of 10th values starting from three points
X11()
par(mfrow=c(1,3))
losunif_runif(2100)
# Plot 1
plot(xes[1:101],yes[1:101],type="l",lwd=2,col="sienna3",xlab="x",ylab=expression(f(x)))
polygon(xes,yes,col="gold")
obs_matrix(0,ncol=2,nrow=100)
obs[1,1]_.01
obs[1,2]_.01
points(obs[1,1],obs[1,2],col="sienna4",pch=20)
counte_0
for (j in 1:100){
 for (i in 2:10){
   counte_counte+1
   obs[i,2]_exp(-0.5*(obs[i-1,1]+3)^2)*losunif[counte]
   counte_counte+1
   obs[i,1]_losunif[counte]*min(1,-3+sqrt(-2*log(obs[i,2])))
   }
 points(obs[i,1],obs[i,2],col="steelblue3",pch=20)   
 }
# Plot 2
plot(xes[1:101],yes[1:101],type="l",lwd=2,col="sienna3",xlab="x",ylab=expression(f(x)))
polygon(xes,yes,col="gold")
obs_matrix(0,ncol=2,nrow=100)
obs[1,1]_.99
obs[1,2]_.0001
points(obs[1,1],obs[1,2],col="sienna4",pch=20)
counte_0
for (j in 1:100){
 for (i in 2:10){
   counte_counte+1
   obs[i,2]_exp(-0.5*(obs[i-1,1]+3)^2)*losunif[counte]
   counte_counte+1
   obs[i,1]_losunif[counte]*min(1,-3+sqrt(-2*log(obs[i,2])))
   }
 points(obs[i,1],obs[i,2],col="steelblue3",pch=20)   
 }
# Plot 3
plot(xes[1:101],yes[1:101],type="l",lwd=2,col="sienna3",xlab="x",ylab=expression(f(x)))
polygon(xes,yes,col="gold")
obs_matrix(0,ncol=2,nrow=100)
obs[1,1]_.25
obs[1,2]_.0025
points(obs[1,1],obs[1,2],col="sienna4",pch=20)
counte_0
for (j in 1:100){
 for (i in 2:10){
   counte_counte+1
   obs[i,2]_exp(-0.5*(obs[i-1,1]+3)^2)*losunif[counte]
   counte_counte+1
   obs[i,1]_losunif[counte]*min(1,-3+sqrt(-2*log(obs[i,2])))
   }
 points(obs[i,1],obs[i,2],col="steelblue3",pch=20)   
 }
# Cleanup
rm(xes,yes,obs)
