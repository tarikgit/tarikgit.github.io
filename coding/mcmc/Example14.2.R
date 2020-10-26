datasim_function(size,tau,eta){
#Initial location & speed
x_0:size
x[1]_0.01
xp_1.2
y_0:size
y[1]_5
yp_.3
z_0:size
z[1]_(y[1]/x[1])+eta*rnorm(1)
for (i in 2:(size+1)){
  xp_xp+tau*rnorm(1)
  x[i]_x[i-1]+xp
  yp_yp+tau*rnorm(1)
  y[i]_y[i-1]+yp
  z[i]_(y[i]/x[i])+eta*rnorm(1)
  }
list(angle=z,x=x,y=y)
}

dataplot_function(x,y,z){
# Plots the tracks of the target and the
# corresponding angles
  plot(x,y,type="l",xlab="x",ylab="y",
       xlim=c(min(0,x),max(x)+1),ylim=c(min(0,y),max(y)+1))
  points(x,y,pch="+",cex=1.5)
  for (i in 1:101)
    lines(c(0,10*max(x,y)),c(0,10*max(x,y)*z[i]),lty=3)
  }

sis_function(size,npart,z,tau,eta){
# Simulate a particle population for size
# iterations and npart particles w/o resampling
# Initialisation
  omega_matrix(0,ncol=npart,nrow=size)
  xpart_omega
  ypart_omega
  # Run
  vx_1.2+tau*rnorm(npart)
  vy_.3+tau*rnorm(npart)
  xpart[1,]_1.2+vx
  ypart[1,]_ 5 +vy
  omega[1,]_(z[2]-ypart[1,]/xpart[1,])^2
  for (t in 2:size){
    vx_vx+tau*rnorm(npart)
    vy_vy+tau*rnorm(npart)
    xpart[t,]_xpart[t-1,]+vx
    ypart[t,]_ypart[t-1,]+vy
    omega[t,]_(z[t+1]-ypart[t,]/xpart[t,])^2
  }
  omega_-apply(omega,2,cumsum)/(2.*eta^2) #cumulated sums
  best_(t(apply(t(omega),2,order)))[,npart]  # should give the best at each iteration
  bestun_best+npart*((1:size)-1)
  bestend_best[size]
  list(weights=t(omega)[bestun],x=t(xpart)[bestun],y=t(ypart)[bestun],
  xend=xpart[,bestend],yend=ypart[,bestend])
}

ris_function(size,npart,z,tau,eta){
# Simulate a particle population for size
# iterations and npart particles w resampling
# Initialisation
  omega_matrix(0,ncol=npart,nrow=size)
  xpart_omega
  xstep_xpart
  ypart_omega
  ystep_ypart
  # Run : starts from true location and speed
  vx_1.2+tau*rnorm(npart)
  vy_.3+tau*rnorm(npart)
  xpart[1,]_.01+vx
  ypart[1,]_ 5+vy
  omega[1,]_exp(-(z[2]-ypart[1,]/xpart[1,])^2/(2*eta^2))
  omega[1,]_omega[1,]/sum(omega[1,])
  survl_sample(1:npart,npart,replace=TRUE,prob=omega[1,])
  x_xpart[1,survl]
  y_ypart[1,survl]
  xpart[1,]_x
  ypart[1,]_y
  xstep[1,]_x
  ystep[1,]_y
  for (t in 2:size){
    vx_vx+tau*rnorm(npart)
    vy_vy+tau*rnorm(npart)
    xpart[t,]_xpart[t-1,]+vx
    ypart[t,]_ ypart[t-1,]+vy
    omega[t,]_exp(-(z[t+1]-ypart[t,]/xpart[t,])^2/(2*eta^2))
    omega[t,]_omega[t,]/sum(omega[t,])
    survl_sample(1:npart,npart,replace=TRUE,prob=omega[t,])
    for (j in 1:t){ # Reallocate the whole path
      x_xpart[j,survl]
      y_ypart[j,survl]
      xpart[j,]_x
      ypart[j,]_y
      }
    xstep[t,]_xpart[t,] # Only change the current particles
    ystep[t,]_ypart[t,]
    }
  list(weights=omega,x=xpart,y=ypart,xst=xstep,yst=ystep)
}

whole_function(size,npart,tau,eta){
# Create the data
res_datasim(size,tau,eta)
# Runs the SIS procedure
ras_sis(size,npart,res$angle,tau,eta)
# Plots the results
X11(); plot(res$x,res$y,type="l",xlab="x",ylab="y",lwd=2,
       xlim=c(min(0,res$x),max(res$x)+1),ylim=c(min(0,res$y),max(res$y)+1))
lines(ras$x,ras$y,lty=2,col="sienna4",lwd=2)
lines(ras$xend,ras$yend,lty=3,col="steelblue",lwd=2)
title(main="SIS")
# Runs the RIS procedure
rus_ris(size,npart,res$angle,tau,eta)
# Plots the results
X11(); plot(res$x,res$y,type="l",xlab="x",ylab="y",lwd=2,
       xlim=c(min(0,res$x),max(res$x)+1),ylim=c(min(0,res$y),max(res$y)+1))
lines(apply(rus$x,1,mean),apply(rus$y,1,mean),lty=2,col="sienna4",lwd=2)
lines(apply(rus$xst,1,mean),apply(rus$yst,1,mean),lty=3,col="steelblue",lwd=2)
title(main="RIS")
# Ranges
X11(); plot(res$x,res$y,type="l",xlab="x",ylab="y",lwd=2,
       xlim=c(min(0,res$x),max(res$x)+1),ylim=c(min(0,res$y),max(res$y)+1))
sampin_sample(1:npart,100)
for (i in sampin)
lines(rus$x[,i],rus$y[,i],col="gray")
lines(res$x,res$y,lwd=2)
title(main="Final RIS range")
X11(); plot(res$x,res$y,type="l",xlab="x",ylab="y",lwd=2,
       xlim=c(min(0,res$x),max(res$x)+1),ylim=c(min(0,res$y),max(res$y)+1))
sampin_sample(1:npart,100)
for (i in sampin)
lines(rus$xst[,i],rus$yst[,i],col="gray")
lines(res$x,res$y,lwd=2)
title(main="Stepwise RIS range")
}
