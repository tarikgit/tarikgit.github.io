# This is a probit example to illustrate convergence issues
# for the Chapter "Diagnosing convergence"

# Data generation
genP_function(n,beta,sigma,mu,tau){
x_rnorm(n,mean=mu,sd=tau)
y_runif(n)<pnorm(x*beta/sqrt(sigma))
list(x=x,y=y)
}

# Posterior surface
likP_function(x,y,lB,uB,lS,uS,prec=100){
 beta_seq(lB,uB,(uB-lB)/(prec-1))[1:prec]
 sigma_seq(lS,uS,(uS-lS)/(prec+9))[1:(prec+10)]
 div_beta%*%t(1/sqrt(sigma))
 sur_matrix(0,nrow=prec,ncol=(prec+10))
 for (i in 1:prec)
 for (j in 1:(prec+10)){
  a_x*div[i,j]
  sur[i,j]_sum( pnorm(a,log=T)*y + pnorm(-a,log=T)*(1-y) )
 }
# prior: exp(1) on 1/sigma and N(0,25) on beta
 for (j in 1:(prec+10))
	sur[,j]_sur[,j]-2*log(sigma[j])-1/sigma[j]
 for (i in 1:prec)
	sur[i,]_sur[i,]-beta[i]^2/50
 list(l=sur,b=beta,s=sigma)
}

# posterior
lik1_function(x,y,B,S)
 sum( pnorm(x*B/sqrt(S),log=T)*y + pnorm(-x*B/sqrt(S),log=T)*(1-y) ) - 2*log(S) - B^2/50 - 1/S

#Gibbs sampling
gibP_function(m,x,y,B0,S0){
beta_0*(1:m)
sigma_beta
beta[1]_B0
sigma[1]_S0
like_1:m
oldL_lik1(x,y,B0,S0)
like[1]_oldL
for (i in 2:m){
# 1. Simulation of beta
propB_beta[i-1]+rnorm(1)
propL_lik1(x,y,propB,sigma[i-1])
if (log(runif(1))<propL-oldL){
  beta[i]_propB
  oldL_propL
  }
else{
  beta[i]_beta[i-1]
  }
# 2. Simulation of sigma
propS_exp(log(sigma[i-1])+.2*rnorm(1))
propL_lik1(x,y,beta[i],propS)
if (log(runif(1))<propL-oldL-log(sigma[i-1])+log(propS)){
  sigma[i]_propS
  oldL_propL
}
else{
  sigma[i]_sigma[i-1]
}
like[i]_oldL
}
list(b=beta,s=sigma,l=like)
}
