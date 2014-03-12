#ifndef __AF_R_WRAPPER_H
#define __AF_R_WRAPPER_H

#include <R.h>
#include <Rdefines.h>
#include <arrayfire.h>
#include <af/utils.h>

#ifdef __cplusplus
#define EXTERNC extern "C" SEXP
#endif

#define IntPtr(x, idx) (INTEGER(x) + idx)
#define RealPtr(x, idx) (REAL(x) + idx)
#define CplxPtr(x, idx) (cdouble *)(COMPLEX(x) + idx)


typedef union {
    int v[2];
    void *ptr;
} int2ptr;

af::array *getPtr(SEXP S);
af::dim4 getDims(SEXP _dims);
SEXP getSEXP(af::array *ptr);

#endif
