#include <stdio.h>
#include "R_wrapper.h"

////Matmul

EXTERNC afr_matmul(SEXP A, SEXP B)
{
    af_array c;
    af_array a = getPtr(A);
    af_array b = getPtr(B);
    AF_CHECK(af_matmul(&c, a, b, AF_MAT_NONE, AF_MAT_NONE));
    return getSEXP(c);
}

//Matmul Transpose

EXTERNC afr_matmul_nt(SEXP A, SEXP B)
{
    af_array c;
    af_array a = getPtr(A);
    af_array b = getPtr(B);
    AF_CHECK(af_matmul(&c, a, b, AF_MAT_NONE, AF_MAT_TRANS));
    return getSEXP(c);
}

EXTERNC afr_matmul_tt(SEXP A, SEXP B)
{
    af_array c;
    af_array a = getPtr(A);
    af_array b = getPtr(B);
    AF_CHECK(af_matmul(&c, a, b, AF_MAT_TRANS, AF_MAT_TRANS));
    return getSEXP(c);
}

EXTERNC afr_matmul_tn(SEXP A, SEXP B)
{
    af_array c;
    af_array a = getPtr(A);
    af_array b = getPtr(B);
    AF_CHECK(af_matmul(&c, a, b, AF_MAT_TRANS, AF_MAT_NONE));
    return getSEXP(c);
}

//Matmul Conjugate Transpose

EXTERNC afr_matmul_nct(SEXP A, SEXP B)
{
    af_array c;
    af_array a = getPtr(A);
    af_array b = getPtr(B);
    AF_CHECK(af_matmul(&c, a, b, AF_MAT_NONE, AF_MAT_CTRANS));
    return getSEXP(c);
}

EXTERNC afr_matmul_ctct(SEXP A, SEXP B)
{
    af_array c;
    af_array a = getPtr(A);
    af_array b = getPtr(B);
    AF_CHECK(af_matmul(&c, a, b, AF_MAT_CTRANS, AF_MAT_CTRANS));
    return getSEXP(c);
}

EXTERNC afr_matmul_ctn(SEXP A, SEXP B)
{
    af_array c;
    af_array a = getPtr(A);
    af_array b = getPtr(B);
    AF_CHECK(af_matmul(&c, a, b, AF_MAT_CTRANS, AF_MAT_NONE));
    return getSEXP(c);
}

////End of Matmul

////Dot

EXTERNC afr_dot(SEXP A, SEXP B)
{
    af_array c;
    af_array a = getPtr(A);
    af_array b = getPtr(B);
    AF_CHECK(af_dot(&c, a, b, AF_MAT_NONE, AF_MAT_NONE));
    return getSEXP(c);
}

//Matmul Transpose

EXTERNC afr_dot_nt(SEXP A, SEXP B)
{
    af_array c;
    af_array a = getPtr(A);
    af_array b = getPtr(B);
    AF_CHECK(af_dot(&c, a, b, AF_MAT_NONE, AF_MAT_TRANS));
    return getSEXP(c);
}

EXTERNC afr_dot_tt(SEXP A, SEXP B)
{
    af_array c;
    af_array a = getPtr(A);
    af_array b = getPtr(B);
    AF_CHECK(af_dot(&c, a, b, AF_MAT_TRANS, AF_MAT_TRANS));
    return getSEXP(c);
}

EXTERNC afr_dot_tn(SEXP A, SEXP B)
{
    af_array c;
    af_array a = getPtr(A);
    af_array b = getPtr(B);
    AF_CHECK(af_dot(&c, a, b, AF_MAT_TRANS, AF_MAT_NONE));
    return getSEXP(c);
}

//Matmul Conjugate

EXTERNC afr_dot_nc(SEXP A, SEXP B)
{
    af_array c;
    af_array a = getPtr(A);
    af_array b = getPtr(B);
    AF_CHECK(af_dot(&c, a, b, AF_MAT_NONE, AF_MAT_CONJ));
    return getSEXP(c);
}

EXTERNC afr_dot_cc(SEXP A, SEXP B)
{
    af_array c;
    af_array a = getPtr(A);
    af_array b = getPtr(B);
    AF_CHECK(af_dot(&c, a, b, AF_MAT_CONJ, AF_MAT_CONJ));
    return getSEXP(c);
}

EXTERNC afr_dot_cn(SEXP A, SEXP B)
{
    af_array c;
    af_array a = getPtr(A);
    af_array b = getPtr(B);
    AF_CHECK(af_dot(&c, a, b, AF_MAT_CONJ, AF_MAT_NONE));
    return getSEXP(c);
}

//Matmul Conjugate Transpose

EXTERNC afr_dot_nct(SEXP A, SEXP B)
{
    af_array c;
    af_array a = getPtr(A);
    af_array b = getPtr(B);
    AF_CHECK(af_dot(&c, a, b, AF_MAT_NONE, AF_MAT_CTRANS));
    return getSEXP(c);
}

EXTERNC afr_dot_ctct(SEXP A, SEXP B)
{
    af_array c;
    af_array a = getPtr(A);
    af_array b = getPtr(B);
    AF_CHECK(af_dot(&c, a, b, AF_MAT_CTRANS, AF_MAT_CTRANS));
    return getSEXP(c);
}

EXTERNC afr_dot_ctn(SEXP A, SEXP B)
{
    af_array c;
    af_array a = getPtr(A);
    af_array b = getPtr(B);
    AF_CHECK(af_dot(&c, a, b, AF_MAT_CTRANS, AF_MAT_NONE));
    return getSEXP(c);
}

////End of Dot

////Tranpose

EXTERNC afr_transpose(SEXP A)
{
    af_array ta;
    af_array a = getPtr(A);
    AF_CHECK(af_transpose(&ta, a, false));
    return getSEXP(ta);
}

////End of Transpose
