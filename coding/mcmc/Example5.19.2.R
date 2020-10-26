# Production of the likelihood surface of a
# normal mean mixture
sampl_rnorm(500)+(runif(500)<.3)*2.5
X11(width=12)
par(mfrow=c(1,2))
hist(sampl,nclass=50,xlab="x",ylab="",col="steelblue2",
main="Echantillon de 0.3 N(2.5,1)+ 0.7 N(0,1)",proba=T)
xz_seq(min(sampl),max(sampl),(max(sampl)-min(sampl))/1000)
lines(xz,(.3*exp(-.5*(xz-2.5)^2)+.7*exp(-.5*xz^2))/sqrt(2*pi),col="sienna2",lwd=2.2)
mu1_seq(-0.5,0.5,.008)
mu2_seq(2.0,3.0,.008)
mo1_mu1%*%t(mu2/mu2)
mo2_(mu2/mu2)%*%t(mu2)
ca1_-0.5*mo1*mo1
ca2_-0.5*mo2*mo2
like_0*mo1
for (i in 1:500)
  like_like+log(0.7*exp(ca1+sampl[i]*mo1)+0.3*exp(ca2+sampl[i]*mo2))
like_like+.1*(ca1+ca2)
like_like-min(like)
like_exp(like)
image(mu1,mu2,like,xlab=expression(mu[1]),ylab=expression(mu[2]),
col = terrain.colors(100))
