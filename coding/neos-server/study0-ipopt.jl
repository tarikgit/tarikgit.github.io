
# Launch the script from Tearminal: include("scriptname.jl")
# Source: https://hackernoon.com/linear-optimization-using-julia-40311c0ad98c

using JuMP
using Ipopt


# Create model
#lpModel = Model(GLPK.Optimizer)
lpModel = Model(Ipopt.Optimizer)
set_optimizer_attributes(lpModel, "tol" => 1e-4, "max_iter" => 100)
#lpModel = Model(solver = CbcSolver(seconds = 3600))

@variable(lpModel, XM <= 600)
@variable(lpModel, XE <= 400)

# Create an objective
@objective(lpModel, Max, 25*XM + 30*XE)

# Create constraints
@constraint(lpModel, (1/20)*XM+(1/14)*XE <= 40)
#@constraint(lpModel, 2x + 3y >= 28)

# Solve and read the answer
optimize!(lpModel)
#status = JuMP.solve(lpModel)

#termination_status(lpModel)
#primal_status(lpModel)
#dual_status(lpModel)
println("Value of objective function : $(objective_value(lpModel))"  )

println("Value of XM (memorization) : $(getvalue(XM))")
println("Value of XE (exercise) : $(getvalue(XE))")
