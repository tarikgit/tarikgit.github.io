# Accept-reject algorithm of a Beta(2.7,6.3) based on uniforms
ys_runif(1000)
maxd_dbeta(1.7/(1.7+5.3),2.7,6.3)
us_maxd*runif(1000)
val_seq(0,1.,.01)
valf_dbeta(val,shape1=2.7,shape2=6.3)
plot(val,valf,type="l",xlab="x",ylab="density",lwd=2)
polygon(c(val,rev(val)),c(valf,0*valf),col="gold2")
points(ys,us,cex=.4,pch=20)
