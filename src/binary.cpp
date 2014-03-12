#include <stdio.h>
#include "R_wrapper.h"
using namespace af;

#define BINARY(fn, op)                          \
    EXTERNC af_##fn##_aa(SEXP A, SEXP B)        \
    {                                           \
        array *a = getPtr(A);                   \
        array *b = getPtr(B);                   \
        array *c = new array();                 \
        *c = *a op *b;                          \
        return getSEXP(c);                      \
    }                                           \
                                                \
    EXTERNC af_##fn##_an(SEXP A, SEXP B)        \
    {                                           \
        array *a = getPtr(A);                   \
        double b = *RealPtr(B, 0);              \
        array *c = new array();                 \
        *c = *a op b;                           \
        return getSEXP(c);                      \
    }                                           \
                                                \
    EXTERNC af_##fn##_na(SEXP A, SEXP B)        \
    {                                           \
        double a = *RealPtr(A, 0);              \
        array *b = getPtr(B);                   \
        array *c = new array();                 \
        *c = a op *b;                           \
        return getSEXP(c);                      \
    }                                           \

BINARY(add, +)
BINARY(sub, -)
BINARY(mul, *)
BINARY(div, /)
BINARY(lt , <)
BINARY(gt , >)
BINARY(le ,<=)
BINARY(ge ,>=)
BINARY(eq ,==)
BINARY(ne ,!=)

#undef BINARY

#define BINARY(fn)                              \
    EXTERNC af_##fn##_aa(SEXP A, SEXP B)        \
    {                                           \
        array *a = getPtr(A);                   \
        array *b = getPtr(B);                   \
        array *c = new array();                 \
        *c = fn(*a, *b);                        \
        return getSEXP(c);                      \
    }                                           \
                                                \
    EXTERNC af_##fn##_an(SEXP A, SEXP B)        \
    {                                           \
        array *a = getPtr(A);                   \
        double b = *RealPtr(B, 0);              \
        array *c = new array();                 \
        *c = fn(*a, b);                         \
        return getSEXP(c);                      \
    }                                           \
                                                \
    EXTERNC af_##fn##_na(SEXP A, SEXP B)        \
    {                                           \
        double a = *RealPtr(A, 0);              \
        array *b = getPtr(B);                   \
        array *c = new array();                 \
        *c = fn(a, *b);                         \
        return getSEXP(c);                      \
    }                                           \

BINARY(atan2)
BINARY(complex)
BINARY(pow)
BINARY(rem)
BINARY(mod)
BINARY(hypot)

#undef BINARY
