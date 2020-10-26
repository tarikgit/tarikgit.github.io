# This is a program to approximate
# the rejection rate in Johnk's approach
# to simulating Beta(alpha,beta) distributions

U_runif(10000)
V_runif(10000)

alpha_.1*(1:100)
probs_rep(0,100)
for (i in 1:100)
  probs[i]_length( U[(U^(1/alpha[i])+V^(1/alpha[i]))<1] )/10000

plot(alpha,probs,type="l",xlab=expression(alpha==beta),
	ylab="frequency",lwd=2,col="steelblue4")
