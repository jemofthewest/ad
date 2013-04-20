#include "mex.h"

/*
 * tapenadeWrapper.c
 * This is a wrapper for using automatically generated C code from Tapenade in fmin.
 *
 * This is a MEX-file for MATLAB.
 *
 */

/* Gateway Function */
void mexFunction( int nlhs, mxArray *plhs[],
                  int nrhs, const mxArray *prhs[])
{
  /* check for proper number of arguments */
  if (nrhs != 1) {
    mexErrMsgIdAndTxt("Tapenade:jacobian:nrhs",
        "Wrong number of inputs.");
  }
  if (nlhs != 2) {
    mexErrMsgIdAndTxt("Tapenade:jacobian:nlhs",
        "Wrong number of outputs.");
  }

  /* typechecking */
  if (mxGetM(prhs[0]) != 1 || 
      mxIsComplex(prhs[0]) ||
      !mxIsDouble(prhs[0])) {
    mxErrMsgIdAndTxt("Tapenade:jacobian:rhsType",
        "Input must be row vector");
  }
}
