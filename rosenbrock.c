#include <stdio.h>
double rosenbrock(double x[], int n)
{
  double f = 0.0;
  int i;

  for (i = 0; i < n-1; i++)
  {
    f = f + 100 * (x[i]*x[i] - x[i+1])*(x[i]*x[i] - x[i+1]) + (x[i] - 1)*(x[i] - 1);
  }
  return f;
}

int main(int argc, char **argv)
{
  double x[] = { 0.456928, 0.394025, -0.699536, 0.923338 };
  int n = sizeof(x) / sizeof(x[0]);
  double f;

  f = rosenbrock(x,n);

  printf("f is %f\n", f);

  return 0;
}
