#include <stdio.h>
#include "R_wrapper.h"
using namespace af;

EXTERNC af_info_r()
{
    try {
        af::info();
        return (R_NilValue);
    } catch (af::exception &ae) {
        error_return(ae.what());
    }
}

EXTERNC af_sync_r()
{
    try {
        af::sync();
        return (R_NilValue);
    } catch (af::exception &ae) {
        error_return(ae.what());
    }
}

EXTERNC af_print(SEXP A)
{
    try {
        array *a = getPtr(A);
        _print("afArray", *a);
        return (R_NilValue);
    } catch (af::exception &ae) {
        error_return(ae.what());
    }
}

EXTERNC af_dims(SEXP A)
{
    try {
        array *a = getPtr(A);
        SEXP res = NEW_NUMERIC(a->numdims());
        for (int i = 0; i < a->numdims(); i++)
            *RealPtr(res, i) = a->dims(i);
        return res;
    } catch (af::exception &ae) {
        error_return(ae.what());
    }
}

EXTERNC af_dims_strip(SEXP A)
{
    try {
        array *a = getPtr(A);

        int strip = 0;
        for (int i = a->numdims() - 1; i >= 1; i--) {
            if (a->dims(i) == 1) strip++;
            else break;
        }

        int numdims = a->numdims() - strip;

        SEXP res = NEW_NUMERIC(numdims);

        for (int i = 0; i < numdims; i++)
            *RealPtr(res, i) = a->dims(i);

        return res;
    } catch (af::exception &ae) {
        error_return(ae.what());
    }
}

EXTERNC af_host(SEXP A)
{
    try {
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
    } catch (af::exception &ae) {
        error_return(ae.what());
    }
}

EXTERNC af_array(SEXP data, SEXP _dims, SEXP _type)
{
    try {
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

        *a = (*a).as(ty);

        SEXP res = getSEXP(a);
        return res;
    } catch(af::exception &ae) {
        error_return(ae.what());
    }
}

EXTERNC af_runif(SEXP _dims, SEXP _mn, SEXP _mx, SEXP _type)
{
    try {
        dtype ty = (dtype)*(IntPtr(_type, 0));
        double mn = *RealPtr(_mn, 0);
        double mx = *RealPtr(_mx, 0);

        array *a = new array();
        *a = randu(getDims(_dims), ty) * (mx - mn) + mn;

        return getSEXP(a);
    } catch(af::exception &ae) {
        error_return(ae.what());
    }
}

EXTERNC af_rnorm(SEXP _dims, SEXP _mean, SEXP _sd, SEXP _type)
{
    try {
        dtype ty = (dtype)*(IntPtr(_type, 0));
        double mean = *RealPtr(_mean, 0);
        double sd = *RealPtr(_sd, 0);

        array *a = new array();
        *a = randn(getDims(_dims), ty) * (sd) + mean;

        return getSEXP(a);
    } catch(af::exception &ae) {
        error_return(ae.what());
    }
}

EXTERNC af_consts(SEXP _val, SEXP _dims,  SEXP _type)
{
    try {
        dtype ty = (dtype)*(IntPtr(_type, 0));
        double val = *RealPtr(_val, 0);

        array *a = new array();
        *a = constant(val, getDims(_dims), ty);

        return getSEXP(a);
    } catch(af::exception &ae) {
        error_return(ae.what());
    }
}
