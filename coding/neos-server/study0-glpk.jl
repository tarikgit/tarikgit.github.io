
# Launch the script from Tearminal: include("scriptname.jl")
# Source: https://hackernoon.com/linear-optimization-using-julia-40311c0ad98c

using JuMP
using GLPK

# Create model
lpModel = Model(GLPK.Optimizer)

@variable(lpModel, XM <= 600)
@variable(lpModel, XE <= 400)

# Create an objective
@objective(lpModel, Max, 25*XM + 30*XE)

# Create constraints
@constraint(lpModel, (1/20)*XM+(1/14)*XE <= 40)

# Solve and read the answer
optimize!(lpModel)

println("Value of objective function : $(objective_value(lpModel))"  )
println("Value of XM (memorization) : $(getvalue(XM))")
println("Value of XE (exercise) : $(getvalue(XE))")
