# function 
f=function(x){
exp(-x^2/2)*(1+sin(6*x)^2+cos(x)^2*sin(4*x)^2)}

# ratio
rat=function(x){
.33*(1+sin(6*x)^2+cos(x)^2*sin(4*x)^2)}

# Accept-Reject
refn=rnorm(1000)
refu=runif(1000)
gene=refn[refu[]<rat(refn[])]
genu=refu[refu[]<rat(refn[])]

polb=f(seq(-4,4,.01))
polo=3*exp(-seq(-4,4,.01)^2/2)
plot(seq(-4,4,.01),polo,type="l",xlab="",ylab="")
lines(seq(-4,4,.01),polb)
polygon(c(seq(-4,4,.01),seq(4,-4,-.01)),c(polb,0*seq(4,-4,-.01)),col="sienna3")
polygon(c(seq(-4,4,.01),seq(4,-4,-.01)),c(polo,f(seq(4,-4,-.01))),col="wheat")
points(gene,genu*f(gene)/rat(gene),pch=20,cex=.3)
