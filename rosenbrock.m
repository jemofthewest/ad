function f = rosenbrock(x)

n = length(x);

f_temp = zeros(n-1,1);
for i = 1:n-1
  f_temp(i) = 100 * (x(i)^2 - x(i+1))^2 + (x(i) - 1)^2;
end

f = sum(f_temp);
