#include <stdio.h>
#include "R_wrapper.h"

// Because I am lazy
#define af_accum_all(...) AF_SUCCESS

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

ALGO_DIM(sum)
ALGO_DIM(any_true)
ALGO_DIM(all_true)
ALGO_DIM(max)
ALGO_DIM(min)
ALGO_DIM(count)
ALGO_DIM(accum)
#undef ALGO_DIM

EXTERNC afr_where(SEXP A)
{
    af_array a = getPtr(A);
    af_array b = 0;
    AF_CHECK(af_where(&b, a));
    return getSEXP(b);
}
