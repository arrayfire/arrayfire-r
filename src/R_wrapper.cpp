#include <stdio.h>
#include "R_wrapper.h"

static void afr_destroy(SEXP A)
{
    af_array a = getPtr(A);
    if (a != 0) {
        af_release_array(a);
    }
}

SEXP getSEXP(af_array arr)
{
    SEXP res = R_MakeExternalPtr(arr, R_NilValue, R_NilValue);
    R_RegisterCFinalizerEx(res, afr_destroy, TRUE);
    return res;
}

af_array getPtr(SEXP S)
{
    return (af_array)(R_ExternalPtrAddr(S));
}

void getDims(unsigned *ndims,
             dim_t dims[4],
             SEXP _dims)
{
    *ndims = length(_dims);

    for (int i = 0; i < *ndims; i++) {
        dims[i] = *(IntPtr(_dims, i));
    }
}
