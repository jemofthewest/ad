#include <stdio.h>
#include "dbg.h"
#include <dlfcn.h>

typedef void (*lib_function)(double x[], double xd[], double *f, double *fd, int n);

int main(int argc, char *argv[])
{
  int rc = 0;
  check(argc == 2, "USAGE: testlib librosenbrock.so");

  char *lib_file = argv[1];
  char *func_to_run = "rosenbrock_d";

  void *lib = dlopen(lib_file, RTLD_NOW);
  check(lib != NULL, "Failed to open the library %s: %s", lib_file, dlerror());

  lib_function func = dlsym(lib, func_to_run);
  check(func != NULL, "Did not find %s function in the library %s: %s", func_to_run, lib_file, dlerror());

  double x[4] = {1.0, 1.0, 1.0, 1.1};
  double xd[4] = {0.0, 0.0, 1.0, 0.0};
  double f, fd, n = 4;

  func(x,xd,&f,&fd,n);

  printf("f is %f\n", f);
  printf("fd is %f\n", fd);

  rc = dlclose(lib);
  check(rc == 0, "Failed to close %s", lib_file);

  return 0;

error:
  return 1;
}


