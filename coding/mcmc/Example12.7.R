# This illustrates the Riemann sum evaluation of the missing
# mass (Chapter 12)

# Density of interest : exp(-x^2/2) (4*(x-.3)^2+.01)
# with normalizing constant 1 / (sqrt(2*pi)*(.01+4*(1+.3^2)))
f_function(x){
exp(-x^2/2) * (4*(x-.3)^2+.01) / (sqrt(2*pi)*(.01+4*(1+.3^2)))
}

#Generation of a slow/fast random walk
thet_0*(1:2000)
for (i in 2:2000){
 prop_thet[i-1]+.3*rnorm(1)
 if (runif(1)<f(prop)/f(thet[i-1]))
   thet[i]_prop
 else
   thet[i]_thet[i-1]
}

#Corresponding sequence of masses
mass_0*(1:2000)
that_thet[1]
for (i in 2:2000){
 that_sort(c(that,thet[i]))
 mass[i]_sum((that[2:i]-that[1:(i-1)])*f(that[1:(i-1)]))
 }

# Plots
plot(mass,type="l",ylab="mass",col="sienna4",lwd=2)
par(new=T);plot(thet,pch=5,axes=F,cex=.3,col="steelblue2",ylab="")
