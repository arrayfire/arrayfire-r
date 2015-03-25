#include <stdio.h>
#include "R_wrapper.h"
using namespace af;

#define REDUCE(fn)                              \
    EXTERNC afr_##fn(SEXP A)                     \
    {                                           \
        try {                                   \
            array *a = getPtr(A);               \
            array *b = new array();             \
            *b = fn(flat(*a));                  \
            return getSEXP(b);                  \
        } catch (af::exception &ae) {           \
            error_return(ae.what());            \
        }                                       \
    }                                           \

REDUCE(stdev)
REDUCE(var)
#undef REDUCE

#define REDUCE(fn)                              \
    EXTERNC afr_##fn##2(SEXP A, SEXP B)         \
    {                                           \
        try {                                   \
            array *a = getPtr(A);               \
            array *b = getPtr(B);               \
            array *c = new array();             \
            *c = fn(*a, *b);                    \
            return getSEXP(c);                  \
        } catch (af::exception &ae) {           \
            error_return(ae.what());            \
        }                                       \
    }                                           \

REDUCE(cov)
