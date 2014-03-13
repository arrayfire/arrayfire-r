#include <stdio.h>
#include "R_wrapper.h"
using namespace af;

#define REDUCE(fn)                              \
    EXTERNC af_##fn(SEXP A, SEXP _dim)          \
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
REDUCE(mul)
REDUCE(anytrue)
REDUCE(alltrue)
REDUCE(max)
REDUCE(min)
REDUCE(mean)
REDUCE(median)
REDUCE(stdev)

#undef REDUCE

EXTERNC af_accum(SEXP A, SEXP _dim, SEXP _OP)
{
    try {
        array *a = getPtr(A);
        int dim = (int)*RealPtr(_dim, 0);
        int op  = (int)*RealPtr(_OP, 0);
        array *b = new array();
        *b = accum(*a, dim, (af_op_t)op);
        return getSEXP(b);
    } catch (af::exception &ae) {
        error_return(ae.what());
    }
}

EXTERNC af_where(SEXP A)
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

EXTERNC af_count(SEXP A)
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
