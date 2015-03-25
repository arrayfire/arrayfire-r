#ifndef __AF_R_WRAPPER_H
#define __AF_R_WRAPPER_H

#include <R.h>
#include <Rdefines.h>
#undef eval // defined in Rinternals.h
#include <arrayfire.h>
#include <af/util.h>

#ifdef __cplusplus
#define EXTERNC extern "C" SEXP
#endif

#define IntPtr(x, idx) (INTEGER(x) + idx)
#define RealPtr(x, idx) (REAL(x) + idx)
#define CplxPtr(x, idx) (cdouble *)(COMPLEX(x) + idx)

af::array *getPtr(SEXP S);
af::dim4 getDims(SEXP _dims);
SEXP getSEXP(af::array *ptr);

#endif
