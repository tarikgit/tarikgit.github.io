
using CSV
using DataFrames
using Plots

df = DataFrame(CSV.File("/Users/tarikz/Webpage/tarikgit.github.io/data/01-DP-LIVE.csv"))

#plot(df.Value)

# plot(df.Value[1:38])
# plot(df.Value[39:50])



moving_average(vs,n) = [sum(@view vs[i:(i+n-1)])/n for i in 1:(length(vs)-(n-1))]


smoothing_value = 7

#data1 = [NaN,NaN]
data1 = kron( ones(3, 1), NaN )
data2 = moving_average(df.Value, smoothing_value)
data3 = kron( ones(3, 1), NaN )
data = [data1; data2; data3]

plot(df.TIME, [df.Value, data], legend = false)
