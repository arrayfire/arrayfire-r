#include <R.h>
#include <Rdefines.h>
#undef eval // defined in Rinternals.h
#include <arrayfire.h>

using namespace af;
af::array *getPtr(SEXP S);

extern "C" SEXP af_eval_r(SEXP A)
{
    try {
        array *a = getPtr(A);
        a->eval();
        return (R_NilValue);
    } catch (af::exception &ae) {
        error_return(ae.what());
    }
}
