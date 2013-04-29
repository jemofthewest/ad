using Optim
using Base.Test

require("rosenbrockFcn.jl")

n = 10
x = ones(n)
x[1] += 0.1
x[2] -= 0.1
fd = Array(Float64, n)
#@assert rosenbrock(x) == cRosenbrock(x)
#@assert rosenbrockGradient(x,fd) == cRosenbrockGradient(x,fd)


results = optimize(cRosenbrock, cRosenbrockGradient, x)
println(results)
