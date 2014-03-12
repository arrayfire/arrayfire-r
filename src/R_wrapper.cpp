#include <stdio.h>
#include "R_wrapper.h"
using namespace af;

SEXP getSEXP(array *ptr)
{
    SEXP res;
    res = NEW_INTEGER(2);
    int2ptr p;
    p.v[0] = 0;
    p.v[1] = 0;
    p.ptr = (void *)ptr;

    *IntPtr(res, 0) = p.v[0];
    *IntPtr(res, 1) = p.v[1];

    return res;
}

array *getPtr(SEXP S)
{
    int2ptr p;
    p.v[0] = *IntPtr(S, 0);
    p.v[1] = *IntPtr(S, 1);
    return (array *)p.ptr;
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

