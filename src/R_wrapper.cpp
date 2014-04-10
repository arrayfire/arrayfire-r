#include <stdio.h>
#include "R_wrapper.h"
using namespace af;

static void af_destroy(SEXP A)
{
    try {
        array *a = getPtr(A);
        delete[] a;
        return;
    } catch(af::exception &ae) {
    }
}

SEXP getSEXP(array *ptr)
{
    SEXP res = R_MakeExternalPtr(ptr, R_NilValue, R_NilValue);
    //R_RegisterCFinalizerEx(res, af_destroy, TRUE);
    return res;
}

array *getPtr(SEXP S)
{
    array *ptr = (array *)(R_ExternalPtrAddr(S));
    return ptr;
}

dim4 getDims(SEXP _dims)
{
    int d[4] = {1,1,1,1};
    int ndims = length(_dims);

    for (int i = 0; i < ndims; i++) {
        d[i] = *(IntPtr(_dims, i));
    }

    return dim4(d[0], d[1], d[2], d[3]);
}

