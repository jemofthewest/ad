void rosenbrock(double x[], double* f, int n)
{
  int i;

  for (i = 0; i < n-1; i++)
  {
    *f = *f + 100 * (x[i]*x[i] - x[i+1])*(x[i]*x[i] - x[i+1]) + (x[i] - 1)*(x[i] - 1);
  }
}
