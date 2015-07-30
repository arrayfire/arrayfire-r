#include <stdio.h>
#include "R_wrapper.h"

#define ALGO_DIM(fn)                                \
    EXTERNC afr_##fn(SEXP A, SEXP _dim)             \
    {                                               \
        af_array a = getPtr(A);                     \
        double dim = *RealPtr(_dim, 0);             \
        af_array b = 0;                             \
        AF_CHECK(af_##fn(&b, a, dim));              \
        return getSEXP(b);                          \
    }                                               \
    EXTERNC afr_##fn##_all(SEXP A)                  \
    {                                               \
        af_array a = getPtr(A);                     \
        double real = 0, imag = 0;                  \
        AF_CHECK(af_##fn##_all(&real, &imag, a));   \
        if (imag == 0) {                            \
            SEXP res = NEW_NUMERIC(1);              \
            *RealPtr(res, 0) = real;                \
            return res;                             \
        } else {                                    \
            SEXP res = NEW_COMPLEX(1);              \
            (*CplxPtr(res, 0)).x = real;            \
            (*CplxPtr(res, 0)).x = imag;            \
            return res;                             \
        }                                           \
    }                                               \

ALGO_DIM(stdev)
ALGO_DIM(median)
ALGO_DIM(mean)
#undef ALGO_DIM

EXTERNC afr_var(SEXP A, SEXP _dim)
{
    af_array a = getPtr(A);
    af_array b = 0;
    double dim = *RealPtr(_dim, 0);
    AF_CHECK(af_var(&b, a, false, dim));
    return getSEXP(b);
}

EXTERNC afr_var_all(SEXP A)
{
    af_array a = getPtr(A);
    double real = 0, imag = 0;
    AF_CHECK(af_var_all(&real, &imag, a, false));
    if (imag == 0) {
        SEXP res = NEW_NUMERIC(1);
        *RealPtr(res, 0) = real;
        return res;
    } else {
        SEXP res = NEW_COMPLEX(1);
        (*CplxPtr(res, 0)).x = real;
        (*CplxPtr(res, 0)).x = imag;
        return res;
    }
}

EXTERNC afr_cov(SEXP A, SEXP B)
{
    af_array a = getPtr(A);
    af_array b = getPtr(B);
    af_array c = 0;
    AF_CHECK(af_cov(&c, a, b, false));
    return getSEXP(c);
}
