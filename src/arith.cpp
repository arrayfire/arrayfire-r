#include <stdio.h>
#include "R_wrapper.h"

#define BINARY(fn)                                          \
    EXTERNC afr_##fn##_aa(SEXP A, SEXP B, SEXP Batch)       \
    {                                                       \
        af_array a = getPtr(A);                             \
        af_array b = getPtr(B);                             \
        af_array c = 0;                                     \
        bool batch = (bool)*IntPtr(Batch, 0);               \
        AF_CHECK(af_##fn(&c, a, b, batch));                 \
        return getSEXP(c);                                  \
    }                                                       \
    EXTERNC afr_##fn##_an(SEXP A, SEXP B, SEXP Batch)       \
    {                                                       \
        af_array a = getPtr(A);                             \
        double b_scal = *RealPtr(B, 0);                     \
        af_array b = 0;                                     \
        unsigned ndims = 0;                                 \
        dim_t d[4] = {1, 1, 1, 1};                          \
        af_dtype ty = f32;                                  \
        AF_CHECK(af_get_numdims(&ndims, a));                \
        AF_CHECK(af_get_dims(d + 0,                         \
                             d + 1,                         \
                             d + 2,                         \
                             d + 3,                         \
                             a));                           \
        AF_CHECK(af_get_type(&ty, a));                      \
        AF_CHECK(af_constant(&b, b_scal, ndims, d, ty));    \
        af_array c = 0;                                     \
        bool batch = (bool)*IntPtr(Batch, 0);               \
        AF_CHECK(af_##fn(&c, a, b, batch));                 \
        AF_CHECK(af_release_array(b));                      \
        return getSEXP(c);                                  \
    }                                                       \
    EXTERNC afr_##fn##_na(SEXP A, SEXP B, SEXP Batch)       \
    {                                                       \
        double a_scal = *RealPtr(A, 0);                     \
        af_array a = 0;                                     \
        af_array b = getPtr(B);                             \
        unsigned ndims = 0;                                 \
        dim_t d[4] = {1, 1, 1, 1};                          \
        af_dtype ty = f32;                                  \
        AF_CHECK(af_get_numdims(&ndims, b));                \
        AF_CHECK(af_get_dims(d + 0,                         \
                             d + 1,                         \
                             d + 2,                         \
                             d + 3,                         \
                             b));                           \
        AF_CHECK(af_get_type(&ty, b));                      \
        AF_CHECK(af_constant(&a, a_scal, ndims, d, ty));    \
        af_array c = 0;                                     \
        bool batch = (bool)*IntPtr(Batch, 0);               \
        AF_CHECK(af_##fn(&c, a, b, batch));                 \
        AF_CHECK(af_release_array(a));                      \
        return getSEXP(c);                                  \
    }                                                       \

BINARY(atan2)
BINARY(cplx2)
BINARY(pow)
BINARY(rem)
BINARY(mod)
BINARY(hypot)
BINARY(add)
BINARY(sub)
BINARY(mul)
BINARY(div)
BINARY(lt )
BINARY(gt )
BINARY(le )
BINARY(ge )
BINARY(eq )
BINARY(neq)

#undef BINARY

#define UNARY(fn)                               \
    EXTERNC afr_##fn(SEXP A)                    \
    {                                           \
        af_array a = getPtr(A);                 \
        af_array b = 0;                         \
        AF_CHECK(af_##fn(&b, a));               \
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
//UNARY(log2)
UNARY(log10)
UNARY(log1p)

UNARY(exp)
UNARY(expm1)
UNARY(erf)
UNARY(erfc)
//UNARY(erfinv)
UNARY(tgamma)
UNARY(lgamma)

UNARY(abs)
UNARY(sqrt)

UNARY(round)
UNARY(ceil)
UNARY(floor)
//UNARY(trunc)
//UNARY(sign)

UNARY(real)
UNARY(imag)
UNARY(conjg)

#undef UNARY
