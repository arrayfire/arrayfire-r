#include <stdio.h>
#include "R_wrapper.h"
using namespace af;

EXTERNC info()
{
    af::info();
    return (R_NilValue);
}

EXTERNC af_print(SEXP A)
{
    array *a = getPtr(A);
    _print("afArray", *a);

    return (R_NilValue);
}

EXTERNC af_host(SEXP A)
{
    array *a = getPtr(A);
    SEXP res;

    if (a->type() == f32 ||
        a->type() == f64) {
        *a = a->as(f64);
        res = NEW_NUMERIC(a->elements());
        double *ptr = RealPtr(res, 0);
        a->host(ptr);
    } else if (a->type() == c64 ||
               a->type() == c32) {

        *a = a->as(f64);
        res = NEW_COMPLEX(a->elements());
        cdouble *ptr = CplxPtr(res, 0);
        a->host(ptr);
    } else if (a->type() == b8 ||
               a->type() == s32) {
        *a = a->as(s32);
        res = NEW_INTEGER(a->elements());
        int *ptr = IntPtr(res, 0);
        a->host(ptr);
    } else {
        error_return("Unsupported data type");
    }

    return res;
}

EXTERNC af_array(SEXP data, SEXP _dims, SEXP _type)
{
    dtype ty = (dtype)*(IntPtr(_type, 0));
    array *a;

    dim4 dims=  getDims(_dims);

    if (isComplex(data)) {
        a = new array(dims, CplxPtr(data, 0));
    } else if (isLogical(data) || isInteger(data)) {
        a = new array(dims, IntPtr(data, 0));
    } else {
        a = new array(dims, RealPtr(data, 0));
    }

    SEXP res = getSEXP(a);
    return res;
}

EXTERNC af_runif(SEXP _dims, SEXP _mn, SEXP _mx, SEXP _type)
{
    dtype ty = (dtype)*(IntPtr(_type, 0));
    double mn = *RealPtr(_mn, 0);
    double mx = *RealPtr(_mx, 0);

    array *a = new array();
    *a = randu(getDims(_dims), ty) * (mx - mn) + mn;

    return getSEXP(a);
}

EXTERNC af_rnorm(SEXP _dims, SEXP _mean, SEXP _sd, SEXP _type)
{
    dtype ty = (dtype)*(IntPtr(_type, 0));
    double mean = *RealPtr(_mean, 0);
    double sd = *RealPtr(_sd, 0);

    array *a = new array();
    *a = randn(getDims(_dims), ty) * (sd) + mean;

    return getSEXP(a);
}

EXTERNC af_consts(SEXP _val, SEXP _dims,  SEXP _type)
{
    dtype ty = (dtype)*(IntPtr(_type, 0));
    double val = *RealPtr(_val, 0);

    array *a = new array();
    *a = constant(val, getDims(_dims), ty);
    return getSEXP(a);
}
