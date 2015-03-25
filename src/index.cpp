#include <stdio.h>
#include "R_wrapper.h"
using namespace af;

EXTERNC afr_get_nnss(SEXP x, SEXP i, SEXP j, SEXP k, SEXP l)
{
    // i is numeric array
    // j is numeric array
    // k,l are spans and can be ignored
    int *I = IntPtr(i, 0);
    int *J = IntPtr(j, 0);
    array *X = getPtr(x);
    array *res = new array();

    if (length(i) == 1 && length(j) == 1) {
        *res = (*X)(*I-1, *J-1);
    } else if (length(i) == 1) {
        array jj = array(length(j), J).as(f32);
        *res = (*X)(*I-1, jj-1);
    } else if (length(j) == 1) {
        array ii = array(length(i), I).as(f32);
        *res = (*X)(ii-1, *J-1);
    }else {
        array ii = array(length(i), I).as(f32);
        array jj = array(length(j), J).as(f32);
        *res = (*X)(ii-1, jj-1);
    }

    return getSEXP(res);
}

EXTERNC afr_get_aass(SEXP x, SEXP i, SEXP j, SEXP k, SEXP l)
{
    // i is arrayfire array
    // j is arrayfire array
    // k,l are spans and can be ignored
    array *I = getPtr(i);
    array *J = getPtr(j);
    array *X = getPtr(x);
    array *res = new array();
    *res = (*X)((*I).as(f32)-1, (*J).as(f32)-1);
    return getSEXP(res);
}

EXTERNC afr_get_anss(SEXP x, SEXP i, SEXP j, SEXP k, SEXP l)
{
    // i is arrayfire array
    // j is numeric array
    // k,l are spans and can be ignored
    array *I = getPtr(i);
    int *J = IntPtr(j, 0);
    array *X = getPtr(x);
    array *res = new array();

    if (length(j) == 1) {
        *res = (*X)((*I).as(f32)-1, *J-1);
    } else {
        array jj = array(length(j), J).as(f32);
        *res = (*X)((*I).as(f32)-1, jj-1);
    }

    return getSEXP(res);
}

EXTERNC afr_get_nass(SEXP x, SEXP i, SEXP j, SEXP k, SEXP l)
{
    // i is numeric array
    // j is arrayfire array
    // k,l are spans and can be ignored
    int *I = IntPtr(i, 0);
    array *J = getPtr(j);
    array *X = getPtr(x);
    array *res = new array();

    if (length(i) == 1) {
        *res = (*X)((*I)-1, (*J).as(f32)-1);
    } else {
        array ii = array(length(i), I).as(f32);
        *res = (*X)(ii-1, (*J).as(f32)-1);
    }

    return getSEXP(res);
}

EXTERNC afr_get_sass(SEXP x, SEXP i, SEXP j, SEXP k, SEXP l)
{
    // j is arrayfire array
    // i, k,l are spans and can be ignored
    array *J = getPtr(j);
    array *X = getPtr(x);
    array *res = new array();
    *res = (*X)(span, (*J).as(f32)-1);
    return getSEXP(res);
}

EXTERNC afr_get_asss(SEXP x, SEXP i, SEXP j, SEXP k, SEXP l)
{
    // i is arrayfire array
    // j, k,l are spans and can be ignored
    array *I = getPtr(i);
    array *X = getPtr(x);
    array *res = new array();
    *res = (*X)((*I).as(f32)-1, span);
    return getSEXP(res);
}


EXTERNC afr_get_snss(SEXP x, SEXP i, SEXP j, SEXP k, SEXP l)
{
    // j is numeric array
    // i, k,l are spans and can be ignored
    int *J = IntPtr(j, 0);
    array *X = getPtr(x);
    array *res = new array();

    if (length(j) == 1) {
        *res = (*X)(span, *J-1);
    } else {
        array jj = array(length(j), J).as(f32) - 1;
        *res = (*X)(span, jj-1);
    }
    return getSEXP(res);
}

EXTERNC afr_get_nsss(SEXP x, SEXP i, SEXP j, SEXP k, SEXP l)
{
    // i is numeric array
    // j, k,l are spans and can be ignored
    int *I = IntPtr(i,0);
    array *X = getPtr(x);
    array *res = new array();

    if (length(i) == 1) {
        *res = (*X)(span, *I-1);
    } else {
        array ii = array(length(i), I).as(f32) - 1;
        *res = (*X)(span, ii-1);
    }
    return getSEXP(res);
}

EXTERNC afr_set_nnss(SEXP x, SEXP v, SEXP i, SEXP j, SEXP k, SEXP l)
{
    // i is numeric array
    // j is numeric array
    // k,l are spans and can be ignored
    int *I = IntPtr(i, 0);
    int *J = IntPtr(j, 0);
    array *X = getPtr(x);
    array *res = new array();
    *res = *X;

    if (length(i) == 1 && length(j) == 1) {
        (*res)(*I-1, *J-1) = *getPtr(v);
    } else if (length(i) == 1) {
        array jj = array(length(j), J).as(f32);
        (*res)(*I-1, jj-1) = *getPtr(v);
    } else if (length(j) == 1) {
        array ii = array(length(i), I).as(f32);
        (*res)(ii-1, *J-1) = *getPtr(v);
    }else {
        array ii = array(length(i), I).as(f32);
        array jj = array(length(j), J).as(f32);
        (*res)(ii-1, jj-1) = *getPtr(v);
    }

    return getSEXP(res);
}

EXTERNC afr_set_aass(SEXP x, SEXP v, SEXP i, SEXP j, SEXP k, SEXP l)
{
    // i is arrayfire array
    // j is arrayfire array
    // k,l are spans and can be ignored
    array *I = getPtr(i);
    array *J = getPtr(j);
    array *X = getPtr(x);
    array *res = new array();
    *res = *X;
    (*res)((*I).as(f32)-1, (*J).as(f32)-1) = *getPtr(v);
    return getSEXP(res);
}

EXTERNC afr_set_anss(SEXP x, SEXP v, SEXP i, SEXP j, SEXP k, SEXP l)
{
    // i is arrayfire array
    // j is numeric array
    // k,l are spans and can be ignored
    array *I = getPtr(i);
    int *J = IntPtr(j, 0);
    array *X = getPtr(x);
    array *res = new array();
    *res = *X;
    if (length(j) == 1) {
        (*res)((*I).as(f32)-1, *J-1) = *getPtr(v);
    } else {
        array jj = array(length(j), J).as(f32);
        (*res)((*I).as(f32)-1, jj-1) = *getPtr(v);
    }
    return getSEXP(res);
}

EXTERNC afr_set_nass(SEXP x, SEXP v, SEXP i, SEXP j, SEXP k, SEXP l)
{
    // i is numeric array
    // j is arrayfire array
    // k,l are spans and can be ignored
    int *I = IntPtr(i, 0);
    array *J = getPtr(j);
    array *X = getPtr(x);
    array *res = new array();
    *res = *X;
    if (length(i) == 1) {
        (*res)((*I)-1, (*J).as(f32)-1) = *getPtr(v);
    } else {
        array ii = array(length(i), I).as(f32);
        (*res)(ii-1, (*J).as(f32)-1) = *getPtr(v);
    }

    return getSEXP(res);
}

EXTERNC afr_set_sass(SEXP x, SEXP v, SEXP i, SEXP j, SEXP k, SEXP l)
{
    // j is arrayfire array
    // i, k,l are spans and can be ignored
    array *J = getPtr(j);
    array *X = getPtr(x);
    array *res = new array();
    *res = *X;
    (*res)(span, (*J).as(f32)-1) = *getPtr(v);
    return getSEXP(res);
}

EXTERNC afr_set_asss(SEXP x, SEXP v, SEXP i, SEXP j, SEXP k, SEXP l)
{
    // i is arrayfire array
    // j, k,l are spans and can be ignored
    array *I = getPtr(i);
    array *X = getPtr(x);
    array *res = new array();
    *res = *X;
    (*res)((*I).as(f32)-1, span) = *getPtr(v);
    return getSEXP(res);
}


EXTERNC afr_set_snss(SEXP x, SEXP v, SEXP i, SEXP j, SEXP k, SEXP l)
{
    // j is numeric array
    // i, k,l are spans and can be ignored
    int *J = IntPtr(j, 0);
    array *X = getPtr(x);
    array *res = new array();
    *res = *X;
    if (length(j) == 1) {
        (*res)(span, *J-1) = *getPtr(v);
    } else {
        array jj = array(length(j), J).as(f32) - 1;
        (*res)(span, jj-1) = *getPtr(v);
    }
    return getSEXP(res);
}

EXTERNC afr_set_nsss(SEXP x, SEXP v, SEXP i, SEXP j, SEXP k, SEXP l)
{
    // i is numeric array
    // j, k,l are spans and can be ignored
    int *I = IntPtr(i,0);
    array *X = getPtr(x);
    array *res = new array();
    *res = *X;
    if (length(i) == 1) {
        (*res)(span, *I-1) = *getPtr(v);
    } else {
        array ii = array(length(i), I).as(f32) - 1;
        (*res)(span, ii-1) = *getPtr(v);
    }
    return getSEXP(res);
}
