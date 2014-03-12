#include <stdio.h>
#include "R_wrapper.h"
using namespace af;

#define UNARY(fn)                               \
    EXTERNC af_##fn(SEXP A)                     \
    {                                           \
        array *a = getPtr(A);                   \
        array *b = new array();                 \
        *b = fn(*a);                            \
        return getSEXP(b);                      \
    }                                           \

UNARY(sin)
UNARY(cos)
UNARY(tan)
UNARY(asin)
UNARY(acos)
UNARY(atan)

UNARY(sinh)
UNARY(cosh)
UNARY(tanh)
UNARY(asinh)
UNARY(acosh)
UNARY(atanh)

UNARY(log)
UNARY(log2)
UNARY(log10)
UNARY(log1p)

UNARY(exp)
UNARY(expm1)
UNARY(erf)
UNARY(erfc)
UNARY(erfinv)
UNARY(gamma)
UNARY(gammaln)

UNARY(abs)
UNARY(sqrt)

UNARY(round)
UNARY(ceil)
UNARY(floor)
UNARY(trunc)
UNARY(sign)

UNARY(real)
UNARY(imag)
UNARY(conjg)

#undef UNARY
