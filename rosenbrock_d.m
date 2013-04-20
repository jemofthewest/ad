function xd = rosenbrock_d(x)

n = length(x);

xd(1) = 2*(x(1) - 1) + 400*x(1)*(x(1)^2 - x(2));
for i=2:n-1
  xd(i) = 2*(x(i) - 1) + 400*x(i)*(x(i)^2 - x(i+1) - 200*(x(i-1)^2 - x(i)));
end
xd(n) = -200*(x(n-1)^2 - x(n));
