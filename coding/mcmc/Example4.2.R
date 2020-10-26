# Example 4.2 of the Cauchy+normal
h1_function(x){
x/(1+x^2)}

h2_function(x){
1/(1+x^2)}

# Implementation of a real confidence band:
N_1000 # Total number of simulations
M_1000  # Number of parralel estimators
uper_round(.95*M)
loer_round(.05*M)
uppa_0*(1:N)
lowa_uppa
avery_lowa
var_avery
var1_avery
var2_avery
cova_avery
Xlo_lowa
Xhi_lowa
kapa_lowa # normalizing constant
estim1_0*(1:M)
estim2_0*(1:M)
estim_estim1
for (i in 1:N){
  norma_rnorm(M)+2.5 # x 
  ash1_h1(norma)
  ash2_h2(norma)
  estim1_estim1+ash1
  estim2_estim2+ash2
  # Empirical evaluation
  estim_sort(estim1/estim2)
  avery[i]_mean(estim)
  lowa[i]_estim[loer]
  uppa[i]_estim[uper]
  Xlo[i]_min(estim)
  Xhi[i]_max(estim)
  # Asymptotic variance evaluation
  kapa[i]_mean(estim2)/i
  var1[i]_var(estim1)
  var2[i]_var(estim2)
  cova[i]_cov(estim1,estim2)
  var[i]_(var1[i]-2*avery[i]*cova[i]+avery[i]^2*var2[i])/(i^2*kapa[i]^2)
  }
plot(avery,ylim=c(.5,4.5),xlab="Iterations",ylab="",type="l",lwd=2.5,col="steelblue3")
#plot(avery,ylim=c(min(lowa),max(uppa)),xlab="Iterations",ylab="",type="l",lwd=2.5,col="steelblue3")
polygon(c(1:N,N:1),c(Xlo,Xhi[N:1]),col="gray78")
lines(avery,lwd=2.5,col="steelblue3")
lines(uppa,lty=2,lwd=2.5,col="steelblue3")
lines(lowa,lty=2,lwd=2.5,col="steelblue3")
lines(avery+sqrt(var),lty=5,lwd=2.5,col="sienna2")
lines(avery-sqrt(var),lty=5,lwd=2.5,col="sienna2")
print(avery[N])
  
