#include <stdio.h>
#include "R_wrapper.h"

static af_err index_s(af_index_t *res, SEXP IDX)
{
    res->isSeq = true;
    res->isBatch =false;
    res->idx.seq = af_span;
    return AF_SUCCESS;
}

static af_err index_n(af_index_t *res, SEXP IDX)
{
    int *idx = IntPtr(IDX, 0);
    bool is_seq = true;
    int num = length(IDX);
    int df = 1;

    if (num > 1) {
        // Check if index is a sequence
        df = idx[1] - idx[0];
        for (int i = 2; is_seq && i < num; i++) {
            is_seq &= (df == (idx[i] - idx[i - 1]));
        }
    }

    res->isSeq = is_seq;
    res->isBatch = false;

    if (is_seq) {
        if (num == 1) {
            af_seq s = {0, *idx - 1, 1};
            res->idx.seq = s;
        } else {
            af_seq s = {0, *idx - 1, 1};
            res->idx.seq = s;
        }
    } else {
        dim_t d = (dim_t)(num);
        return af_create_array(&res->idx.arr, (void *)idx, 1, &d, s32);
    }

    return AF_SUCCESS;
}

static af_err index_a(af_index_t *res, SEXP IDX)
{
    res->isSeq = false;
    res->isBatch = false;
    return af_retain_array(&res->idx.arr, getPtr(IDX));
}

static void indices_release(unsigned num, af_index_t *indices)
{
    for (int i = 0; i < num; i++) {
        if (!indices[i].isSeq) {
            af_release_array(indices[i].idx.arr);
        }
    }
}

#define INDEX(F,S)                                              \
    EXTERNC afr_get_##F##S##ss(SEXP x, SEXP i, SEXP j)          \
    {                                                           \
        af_index_t indices[2];                                  \
        AF_CHECK(index_##F(indices + 0, i));                    \
        AF_CHECK(index_##S(indices + 1, j));                    \
                                                                \
        af_array res = 0;                                       \
        AF_CHECK(af_index_gen(&res, getPtr(x), 2, indices));    \
                                                                \
        indices_release(2, indices);                            \
                                                                \
        return getSEXP(res);                                    \
    }                                                           \
    EXTERNC afr_set_##F##S##ss(SEXP x, SEXP v, SEXP i, SEXP j)  \
    {                                                           \
        af_index_t indices[2];                                  \
        AF_CHECK(index_##F(indices + 0, i));                    \
        AF_CHECK(index_##S(indices + 1, j));                    \
                                                                \
        af_array res = 0;                                       \
        AF_CHECK(af_assign_gen(&res, getPtr(x), 2, indices,     \
                               getPtr(v)));                     \
                                                                \
        indices_release(2, indices);                            \
                                                                \
        return getSEXP(res);                                    \
    }                                                           \

INDEX(n, n)
INDEX(a, a)
INDEX(a, n)
INDEX(n, a)
INDEX(s, a)
INDEX(a, s)
INDEX(s, n)
INDEX(n, s)
