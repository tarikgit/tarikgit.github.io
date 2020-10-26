# Gibbs sampler for a mean mixture
#  [Requires first to run mix.R]
#
sampl_rnorm(500)+(runif(500)<.3)*2.5
mu1_seq(-1.5,3.5,.08)
mu2_mu1
mo1_mu1%*%t(mu2/mu2)
mo2_(mu2/mu2)%*%t(mu2)
ca1_-0.5*mo1*mo1
ca2_-0.5*mo2*mo2
like_0*mo1
for (i in 1:500)
  like_like+log(0.7*exp(ca1+sampl[i]*mo1)+0.3*exp(ca2+sampl[i]*mo2))
like_like+.1*(ca1+ca2)
like_like-min(like)
#
muz_matrix(0,ncol=2,nrow=5000)
gu1_mean(sampl)-.5
gu2_mean(sampl)+.5
muz[1,]_(c(gu1,gu2))
for (t in 2:5000){
# Allocation
  probs_1/(1+.3*sqrt(exp(2*sampl*(gu2-gu1)-gu2^2+gu1^2))/.7)
  zeds_(runif(500)<probs)
# Gibbs samplin
  gu1_rnorm(1)/sqrt(.1+length(zeds[zeds==1]))+(sum(sampl[zeds==1]))/(.1+length(zeds[zeds==1]))
  gu2_rnorm(1)/sqrt(.1+length(zeds[zeds==0]))+(sum(sampl[zeds==0]))/(.1+length(zeds[zeds==0]))
  muz[t,]_(c(gu1,gu2))
# Order!
#  if (gu1>gu2){
#  muz[t,]_(c(gu2,gu1))
#  gu2_gu1
#  gu1_muz[t,1]
#  }
}
X11(width=9,height=9)
for (t in 4900:5000){
  image(mu1,mu2,like,xlab=expression(mu[1]),ylab=expression(mu[2]),col=heat.colors(100))
  points(muz[t-1,1],muz[t-1,2],col="steelblue3",pch=20)
  delay(30)
  lines(c(muz[t-1,1],muz[t,1]),c(muz[t-1,2],muz[t,2]),col="steelblue3")
  points(muz[t,1],muz[t,2],col="steelblue3",pch=20)
  delay(30)
  }
points(muz,pch=18,cex=.5)
