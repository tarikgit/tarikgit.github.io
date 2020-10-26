# Example of the truncated normal distribution
# Case of mu=(-2.4,1.8) and Sigma=((1,-2.2),(-2.2,4.4))
mu_c(-2.4,1.8)
sigma_matrix(c(1,-1.2,-1.2,4.4),nrow=2,ncol=2)
sigmainv_chol2inv(chol(sigma))
# density
densi_function(a,b){
exp(-(c(a/(1-a),b/(1-b))-mu)%*%sigmainv%*%(c(a/(1-a),b/(1-b))-mu)/2)/((1-b)*(1-a))^2
}
# computation of the levels sets
x_seq(0,3,.01)
y_seq(0,10,.01)
zx_x%*%t(rep(1,length(y)))
zy_rep(1,length(x))%*%t(y)
# level plot
level_sigmainv[1,1]*(zx-mu[1])^2+2*sigmainv[1,2]*(zx-mu[1])*(zy-mu[2])+sigmainv[2,2]*(zy-mu[2])^2
zx_1/(1+zx)
zy_1/(1+zy)
level_exp(-0.5*level)/(zx*zy)^2
zx_x/(1+x)
zy_y/(1+y)
image(zx,zy,level,xlab=expression(x/1+x),ylab=expression(y/1+y))
contour(zx,zy,level,add=T)
