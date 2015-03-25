#include <stdio.h>
#include "R_wrapper.h"
using namespace af;

#define REDUCE(fn)                              \
    EXTERNC afr_##fn(SEXP A, SEXP _dim)          \
    {                                           \
        try {                                   \
            array *a = getPtr(A);               \
            double dim = *RealPtr(_dim, 0);     \
            array *b = new array();             \
            if (dim == -1)                      \
                *b = fn(flat(*a));              \
            else                                \
                *b = fn(*a, dim);               \
            return getSEXP(b);                  \
        } catch (af::exception &ae) {           \
            error_return(ae.what());            \
        }                                       \
    }                                           \

REDUCE(sum)
REDUCE(anytrue)
REDUCE(alltrue)
REDUCE(max)
REDUCE(min)
REDUCE(mean)
REDUCE(median)

#undef REDUCE

EXTERNC afr_accum(SEXP A, SEXP _dim)
{
    try {
        array *a = getPtr(A);
        int dim = (int)*RealPtr(_dim, 0);
        array *b = new array();
        *b = accum(*a, dim);
        return getSEXP(b);
    } catch (af::exception &ae) {
        error_return(ae.what());
    }
}

EXTERNC afr_where(SEXP A)
{
    try {
        array *a = getPtr(A);
        array *b = new array();
        *b = where(*a);
        return getSEXP(b);
    } catch (af::exception &ae) {
        error_return(ae.what());
    }
}

EXTERNC afr_count(SEXP A)
{
    try {
        array *a = getPtr(A);
        array *b = new array();
        *b = count(*a);
        return getSEXP(b);
    } catch (af::exception &ae) {
        error_return(ae.what());
    }
}
