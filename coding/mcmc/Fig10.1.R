# Plot of the two circles on Figure 10.1
# Circle one
sek_seq(0,2,.01)
cirk_1-sqrt(1-(sek-1)^2)
cirq_1+sqrt(1-(sek-1)^2)
plot(sek,cirk,ylim=c(-2,2),xlim=c(-2,2),type="l",xlab="x",ylab="y",axes=F)
polygon(c(sek,rev(sek)),c(cirk,rev(cirq)),col="gold2")
# Circle two
sek_seq(0,-2,-.01)
cirk_-1-sqrt(1-(sek+1)^2)
cirq_-1+sqrt(1-(sek+1)^2)
lines(sek,cirk)
polygon(c(sek,rev(sek)),c(cirk,rev(cirq)),col="gold2")
axis(pos=c(0,0),side=1)
axis(pos=c(0,0),side=2)
