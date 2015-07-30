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

typedef struct {
    float x;
    float y;
} afr_cfloat;

typedef struct {
    double x;
    double y;
} afr_cdouble;

#define IntPtr(x, idx) (INTEGER(x) + idx)
#define RealPtr(x, idx) (REAL(x) + idx)
#define CplxPtr(x, idx) (afr_cdouble *)(COMPLEX(x) + idx)

static inline afr_cfloat GetCfloat(SEXP x, int idx)
{
    afr_cdouble tmp = *CplxPtr(x, idx);
    afr_cfloat res = {tmp.x, tmp.y};
    return res;
}

af_array getPtr(SEXP S);

void getDims(unsigned *ndims,
             dim_t dims[4],
             SEXP _dims);

SEXP getSEXP(af_array arr);

#define AF_CHECK(fn) do {                       \
        af_err err = fn;                        \
        if (err == AF_SUCCESS) break;           \
        char *err_msg;                          \
        dim_t len = 0;                          \
        af_get_last_error(&err_msg, &len);      \
        error_return(err_msg);                  \
    } while(0)

#endif
