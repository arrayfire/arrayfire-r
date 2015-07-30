#include <stdio.h>
#include "R_wrapper.h"

EXTERNC afr_info()
{
    AF_CHECK(af_info());
    return (R_NilValue);
}

EXTERNC afr_sync()
{
    int device = 0;
    AF_CHECK(af_get_device(&device));
    AF_CHECK(af_sync(device));
    return (R_NilValue);
}

EXTERNC afr_mem_info()
{
    SEXP result = PROTECT(allocVector(REALSXP, 4));
    size_t alloc_bytes;
    size_t alloc_buffers;
    size_t lock_bytes;
    size_t lock_buffers;

    AF_CHECK(af_device_mem_info(&alloc_bytes,
                                &alloc_buffers,
                                &lock_bytes,
                                &lock_buffers));

    REAL(result)[0] = (double)alloc_bytes;
    REAL(result)[1] = (double)alloc_buffers;
    REAL(result)[2] = (double)lock_bytes;
    REAL(result)[3] = (double)lock_buffers;

    UNPROTECT(1);

    return result;
}


EXTERNC afr_print(SEXP A)
{
    af_array a = getPtr(A);
    AF_CHECK(af_print_array(a));
    return (R_NilValue);
}

EXTERNC afr_dims(SEXP A)
{
    af_array a = getPtr(A);
    unsigned numdims = 0;
    dim_t d[4];

    AF_CHECK(af_get_numdims(&numdims, a));
    AF_CHECK(af_get_dims(d + 0, d + 1, d + 2, d + 3, a));

    SEXP res = NEW_NUMERIC(numdims);
    for (int i = 0; i < numdims; i++)
        *RealPtr(res, i) = d[i];

    return res;
}

EXTERNC afr_host(SEXP A)
{
    af_array a = getPtr(A);
    SEXP res;
    dim_t elements = 0;
    AF_CHECK(af_get_elements(&elements, a));

    af_dtype type = f32;
    AF_CHECK(af_get_type(&type, a));


#define CONVERT(TO, TI, ALLOC)                          \
    do {                                                \
        res = ALLOC(elements);                          \
        TI *ptr = (TI *)malloc(elements * sizeof(TI));  \
        AF_CHECK(af_get_data_ptr(ptr, a));              \
        for (int i = 0; i < elements; i++) {            \
            *RealPtr(res, i) = (TO)ptr[i];              \
        }                                               \
        free(ptr);                                      \
    } while (0)                                         \


    switch (type) {

    case f64:
    {
        res = NEW_NUMERIC(elements);
        double *ptr = RealPtr(res, 0);
        AF_CHECK(af_get_data_ptr(ptr, a));
    }
        break;

    case f32:
        CONVERT(double, float, NEW_NUMERIC);
        break;

    case s32:
        CONVERT(double, int, NEW_NUMERIC);
        break;

    case u32:
        CONVERT(double, unsigned, NEW_NUMERIC);
        break;

    case c32:
    {
        res = NEW_COMPLEX(elements);
        afr_cfloat *ptr = (afr_cfloat *)malloc(elements * sizeof(afr_cfloat));
        AF_CHECK(af_get_data_ptr(ptr, a));
        for (int i = 0; i < elements; i++) {
            (*CplxPtr(res, i)).x = ptr[i].x;
            (*CplxPtr(res, i)).y = ptr[i].y;
        }
        free(ptr);
    }
    break;

    case c64:
    {
        res = NEW_COMPLEX(elements);
        afr_cdouble *ptr = CplxPtr(res, 0);
        AF_CHECK(af_get_data_ptr(ptr, a));
    }
        break;

    case  b8:
        CONVERT(double, char, NEW_NUMERIC);
        break;

    case  u8:
        CONVERT(double, unsigned char, NEW_NUMERIC);
        break;

    default:
        error_return("Unsupported data type");
    }

#undef CONVERT
    return res;
}

EXTERNC afr_array(SEXP data, SEXP _dims, SEXP _type)
{
    af_dtype ty = (af_dtype)*(IntPtr(_type, 0));
    af_array a = 0;

    unsigned ndims = 0;
    dim_t d[4] = {1, 1, 1, 1};
    getDims(&ndims, d, _dims);

    unsigned elements = d[0] * d[1] * d[2] * d[3];

    if (ty == s64 ||
        ty == u64) {
        error_return("unsupported data type for the R wrapper");
    }

    void *data_ptr = NULL;
    void *ptr = NULL;

#define CONVERT(TO, GETVAL)                     \
    do {                                        \
        ptr = malloc(elements * sizeof(TO));    \
        TO *tmp= (TO *)ptr;                     \
        for (int i = 0; i < elements; i++) {    \
            tmp[i] = (TO)GETVAL(data, i);       \
        }                                       \
    } while (0)


    if (isComplex(data)) {
        data_ptr = (void *)CplxPtr(data, 0);

        if (ty == c32) {
            CONVERT(afr_cfloat, GetCfloat);
        } else if (ty == c64) {
            ptr = data_ptr;
        } else {
            error_return("Can not convert to required type during array creation");
        }

    } else if (isLogical(data) || isInteger(data)) {
        data_ptr = (void *)IntPtr(data, 0);

        if (ty == b8) {
            CONVERT(char, *IntPtr);
        } else if (ty == u32)  {
            CONVERT(unsigned, *IntPtr);
        } else if (ty == f32) {
            CONVERT(float, *IntPtr);
        } else if (ty == f64) {
            CONVERT(double, *IntPtr);
        } else if (ty == s32) {
            ptr = data_ptr;
        } else {
            error_return("Can not convert to required type during array creation");
        }

    } else {
        if (ty == f32) {
            CONVERT(float, *RealPtr);
        } else if (ty == f64) {
            ptr = data_ptr;
        } else {
            error_return("Can not convert to required type during array creation");
        }
    }

#undef CONVERT

    AF_CHECK(af_create_array(&a, ptr, ndims, d, ty));
    if (data_ptr != ptr) free(ptr);

    SEXP res = getSEXP(a);
    return res;
}

EXTERNC afr_runif(SEXP _dims, SEXP _mn, SEXP _mx, SEXP _type)
{
    af_dtype ty = (af_dtype)*(IntPtr(_type, 0));
    if (ty == s64 ||
        ty == u64) {
        error_return("unsupported data type for the R wrapper");
    }

    double mn = *RealPtr(_mn, 0);
    double mx = *RealPtr(_mx, 0);

    unsigned ndims = 0;
    dim_t d[4] = {1, 1, 1, 1};
    getDims(&ndims, d, _dims);

    af_array scal = 0;
    af_array add = 0;
    af_array tmp0 = 0;
    af_array tmp1 = 0;
    af_array a = 0;

    AF_CHECK(af_constant(&scal, (mx - mn), ndims, d, ty));
    AF_CHECK(af_constant(&add, mn, ndims, d, ty));
    AF_CHECK(af_randu(&tmp0, ndims, d, ty));
    AF_CHECK(af_mul(&tmp1, tmp0, scal, false));
    AF_CHECK(af_add(&a, tmp1, add, false));

    AF_CHECK(af_release_array(scal));
    AF_CHECK(af_release_array(add));
    AF_CHECK(af_release_array(tmp0));
    AF_CHECK(af_release_array(tmp1));

    return getSEXP(a);
}

EXTERNC afr_rnorm(SEXP _dims, SEXP _mean, SEXP _sd, SEXP _type)
{
    af_dtype ty = (af_dtype)*(IntPtr(_type, 0));
    double mean = *RealPtr(_mean, 0);
    double sd = *RealPtr(_sd, 0);

    unsigned ndims = 0;
    dim_t d[4] = {1, 1, 1, 1};
    getDims(&ndims, d, _dims);

    af_array scal = 0;
    af_array add = 0;
    af_array tmp0 = 0;
    af_array tmp1 = 0;
    af_array a = 0;

    AF_CHECK(af_constant(&scal, sd, ndims, d, ty));
    AF_CHECK(af_constant(&add, mean, ndims, d, ty));
    AF_CHECK(af_randn(&tmp0, ndims, d, ty));
    AF_CHECK(af_mul(&tmp1, tmp0, scal, false));
    AF_CHECK(af_add(&a, tmp1, add, false));

    AF_CHECK(af_release_array(scal));
    AF_CHECK(af_release_array(add));
    AF_CHECK(af_release_array(tmp0));
    AF_CHECK(af_release_array(tmp1));

    return getSEXP(a);
}

EXTERNC afr_consts(SEXP _val, SEXP _dims,  SEXP _type)
{
    af_dtype ty = (af_dtype)*(IntPtr(_type, 0));
    double val = *RealPtr(_val, 0);

    unsigned ndims = 0;
    dim_t d[4] = {1, 1, 1, 1};
    getDims(&ndims, d, _dims);

    af_array a = 0;
    AF_CHECK(af_constant(&a, val, ndims, d, ty));

    return getSEXP(a);
}

EXTERNC afr_eval(SEXP A)
{
    af_array a = getPtr(A);
    AF_CHECK(af_eval(a));
    return (R_NilValue);
}
