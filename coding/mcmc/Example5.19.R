# EM for the mean mixture of normals
#  [require mix.R run first:
sampl_rnorm(500)+(runif(500)<.3)*1.8
mu1_seq(-1.5,3.5,.08)
mu2_seq(-1.5,3.5,.08)
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
X11(width=13,height=7)
par(mar=c(4,4,1,1))
xsur_dev.cur()
image(mu1,mu2,like,xlab=expression(mu[1]),ylab=expression(mu[2]),col=heat.colors(250))
# Function delay, to check points
delay_function(n){
for (j in 1:(n*1000)) x_log(4)^3
}
#
muz_matrix(0,ncol=2,nrow=100)
# Em can start from any
# possible starting point
# but the cost is a dependence on this starting point!
X11(width=13,height=3)
par(mar=c(2,4,1,1))
xlik_dev.cur()
plot(0,0,xlab="t",ylab="log-likelihood",xlim=c(0,20),ylim=c(0.3*max(like),max(like)),col="white")
khol_c("steelblue2","sienna2","slateblue4","seagreen4","tomato3")
for (i in 1:5){
gu1_mean(sampl)+1.5*rnorm(1)
gu2_mean(sampl)+1.5*rnorm(1)
muz[1,]_(c(gu1,gu2))
for (t in 2:100){
# Allocation probabilities and averages
  probs_1/(1+.3*sqrt(exp(2*sampl*(gu2-gu1)-gu2^2+gu1^2))/.7)
  zeds_probs # since zeds in (0,1)
# EM step
  gu1_sum(zeds*sampl)/sum(zeds)
  gu2_sum((1-zeds)*sampl)/sum(1-zeds)
  muz[t,]_(c(gu1,gu2))
# Re-Ordering, if necessary!
#  if (gu1>gu2){
#  muz[t,]_(c(gu2,gu1))
#  gu2_gu1
#  gu1_muz[t,1]
#  }
}
# Plot of the EM moves
#
t_1
dev.set(xlik)
locx_max(1,min(length(mu1),round(length(mu1)*(muz[t,1]-min(mu1))/(max(mu1)-min(mu1)))))
locy_max(1,min(length(mu2),round(length(mu2)*(muz[t,2]-min(mu2))/(max(mu2)-min(mu2)))))
points(0,like[locx,locy],col=khol[i],pch=20)
for (t in 2:100){
    dev.set(xsur)
    points(muz[t-1,1],muz[t-1,2],col=khol[i],pch=20)
    delay(30)
    lines(c(muz[t-1,1],muz[t,1]),c(muz[t-1,2],muz[t,2]),col=khol[i])
    points(muz[t,1],muz[t,2],col=khol[i],pch=20)
    delay(30)
    dev.set(xlik)
    lonx_max(1,min(length(mu1),round(length(mu1)*(muz[t,1]-min(mu1))/(max(mu1)-min(mu1)))))
    lony_max(1,min(length(mu2),round(length(mu2)*(muz[t,2]-min(mu2))/(max(mu2)-min(mu2)))))
    lines(c(t-2,t-1),c(like[locx,locy],like[lonx,lony]),col=khol[i],lwd=1.5)
    points((t-1),like[lonx,lony],col=khol[i],pch=20)
    locx_lonx
    locy_lony
    if ((abs(muz[t-1,1]-muz[t,1])<.0001)&&(abs(muz[t-1,2]-muz[t,2])<.0001)) 
    	break
  }
}
delay(50)
dev.set(xsur)
contour(mu1,mu2,like,levels=seq(min(like),max(like),10),add=T)
