# Example of a 3D slice sampler
# exp -x^2/2 (1+sin^2 3x) (1+cos^4 5x)
x_rep(0,5000)
for (i in 2:5000){
  omega1_(1+sin(3*x[i-1])^2)*runif(1)-1
  omega2_(1+cos(5*x[i-1])^4)*runif(1)-1
  omega3_sqrt(-2*log( runif(1)*exp(-x[i-1]^2/2)))
  repeat{
      y_-omega3+2*omega3*runif(1)
      if ((sin(3*y)^2>omega1)&&(cos(5*y)^4>omega2)) break  
      }
  x[i]_y
  }
plo_hist(x,nclass=75,col="grey",proba=T,xlab="x",ylab="",main="")
labs_seq(-3,3,.01)
dense_(1+sin(3*labs)^2)*(1+cos(5*labs)^4)*exp(-labs^2/2)
dense_dense*max(plo$density)/max(dense)
lines(labs,dense,col="sienna4",lwd=2)
