function cRosenbrock(x::Vector)
    n = length(x)

    # Calls function rosenbrock in shared library librosenbrock.so
    # This function returns f as a double, and takes x[] and n.
    f = ccall( (:rosenbrock, "./librosenbrock.so"), Cdouble, (Ptr{Cdouble}, Cint), x, n )

    return f
end

function cRosenbrockGradient(x::Vector, fd::Vector)
    n = length(x)

    xd = eye(n)

    for i = 1:n
        fd[i] = ccall( (:rosenbrock_gradient, "./librosenbrock.so"), Cdouble, (Ptr{Cdouble}, Ptr{Cdouble}, Cint), x, xd[:,i], n )
    end

    return fd
end

function rosenbrock(x::Vector)
    n = length(x)

    f = 0.0
    for i = 1:n-1
        f = f + 100*(x[i]^2 - x[i+1])^2 + (x[i] - 1)^2
    end

    return f
end
    

function rosenbrockGradient!(x::Vector, fd::Vector)
    n = length(x)

    fd = Array(Float64, n)
    fd[1] = 2*(x[1] - 1) + 400*x[1]*(x[1]^2-x[2])
    for i=2:n-1
        fd[i] = 2*(x[i] - 1) + 400*x[i]*(x[i]^2 - x[i+1] - 200*(x[i-1]^2 - x[i]))
    end
    fd[n] = -200*(x[n-1]^2 - x[n])

    return fd
end

function rosenbrockmin(x::Vector, grad::Vector)
    A = eye(length(x),length(x))
    if length(grad) > 0
      grad = rosenbrockGradient(x)
    end

    f = rosenbrock(x)
end
