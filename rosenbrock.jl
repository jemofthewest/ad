using Optim
using Base.Test

require("rosenbrockFcn.jl")

x = [1,1,1,1.1]
n = length(x)
@assert rosenbrock(x) == cRosenbrock(x)
@assert rosenbrockGradient(x) == cRosenbrockGradient(x)


results = optimize(cRosenbrock, cRosenbrockGradient, [0.0, 0.0, 0.0, 0.0])
