## (Array, Array) operations
############################

setMethod("+", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_add_aa", e1@ptr, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("-", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_sub_aa", e1@ptr, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("*", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_mul_aa", e1@ptr, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("/", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_div_aa", e1@ptr, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("<", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_lt_aa", e1@ptr, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("<=", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_le_aa", e1@ptr, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod(">", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_gt_aa", e1@ptr, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod(">=", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_ge_aa", e1@ptr, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("==", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_eq_aa", e1@ptr, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("!=", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_ne_aa", e1@ptr, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("^", signature(e1="afArray", e2="afArray"),  function(e1, e2) {
    ret = .Call("afr_pow_aa", e1@ptr, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("%%", signature(e1="afArray", e2="afArray"),  function(e1, e2) {
    ret = .Call("afr_mod_aa", e1@ptr, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

## (Array, numeric) operations
##############################

setMethod("+", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_add_an", e1@ptr, e2, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("-", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_sub_an", e1@ptr, e2, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("*", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_mul_an", e1@ptr, e2, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("/", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_div_an", e1@ptr, e2, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("<", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_lt_an", e1@ptr, e2, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("<=", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_le_an", e1@ptr, e2, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod(">", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_gt_an", e1@ptr, e2, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod(">=", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_ge_an", e1@ptr, e2, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("==", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_eq_an", e1@ptr, e2, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("!=", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_ne_an", e1@ptr, e2, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("^", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_pow_an", e1@ptr, e2, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("%%", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_mod_an", e1@ptr, e2, FALSE)
    result <- createArray(ret)
    return (result)
})

## (Numeric, Array) operations
##############################

setMethod("+", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_add_na", e1, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("-", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_sub_na", e1, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("*", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_mul_na", e1, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("/", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_div_na", e1, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("<", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_lt_na", e1, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("<=", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_le_na", e1, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod(">", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_gt_na", e1, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod(">=", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_ge_na", e1, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("==", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_eq_na", e1, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("!=", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_ne_na", e1, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("^", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_pow_na", e1, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

setMethod("%%", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_mod_na", e1, e2@ptr, FALSE)
    result <- createArray(ret)
    return (result)
})

## Non symbolic binary operators
################################
setGeneric("Cplx", function(real, imag) standardGeneric("Cplx"))
setGeneric("hypot", function(x, y) standardGeneric("hypot"))

setMethod("Cplx", signature("afArray", "afArray"),
          function(real, imag) {
              ret = .Call("afr_cplx2_aa", real@ptr, imag@ptr, FALSE)
              result <- createArray(ret)
              return (result)
          })

setMethod("Cplx", signature("afArray", "numeric"),
          function(real, imag=0) {
              ret = .Call("afr_cplx2_an", real@ptr, imag, FALSE)
              result <- createArray(ret)
              return (result)
          })

setMethod("Cplx", signature("numeric", "afArray"),
          function(real=0, imag) {
              ret = .Call("afr_cplx2_na", real, imag@ptr, FALSE)
              result <- createArray(ret)
              return (result)
          })

setMethod("atan2", signature(y="afArray", x="afArray"),
          function(y, x) {
              ret = .Call("afr_atan2_aa", y@ptr, x@ptr, FALSE)
              result <- createArray(ret)
              return (result)
          })

setMethod("atan2", signature(y="afArray", x="numeric"),
          function(y, x) {
              ret = .Call("afr_atan2_an", y@ptr, x, FALSE)
              result <- createArray(ret)
              return (result)
          })

setMethod("atan2", signature(y="numeric", x="afArray"),
          function(y, x) {
              ret = .Call("afr_atan2_na", x, y@ptr, FALSE)
              result <- createArray(ret)
              return (result)
          })

setMethod("hypot", signature("afArray", "afArray"),
          function(x, y) {
              ret = .Call("afr_hypot_aa", x@ptr, y@ptr, FALSE)
              result <- createArray(ret)
              return (result)
          })

setMethod("hypot", signature("afArray", "numeric"),
          function(x, y) {
              ret = .Call("afr_hypot_an", x@ptr, y, FALSE)
              result <- createArray(ret)
              return (result)
          })

setMethod("hypot", signature("numeric", "afArray"),
          function(x, y) {
              ret = .Call("afr_hypot_na", x, y@ptr, FALSE)
              result <- createArray(ret)
              return (result)
          })

## Trigonometric functions
###########################

setMethod("sin", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_sin", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("cos", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_cos", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("tan", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_tan", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("asin", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_asin", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("acos", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_acos", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("atan", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_atan", x@ptr)
              result <- createArray(ret)
              return (result)
          })

## Hyperbolic functions
###########################

setMethod("sinh", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_sinh", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("cosh", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_cosh", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("tanh", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_tanh", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("asinh", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_asinh", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("acosh", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_acosh", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("atanh", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_atanh", x@ptr)
              result <- createArray(ret)
              return (result)
          })

## Logarithmic functions
#########################

setMethod("log", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_log", x@ptr)
              result <- createArray(ret)
              return (result)
          })

## setMethod("log2", signature(x="afArray"),
##           function(x) {
##               ret = .Call("afr_log2", x@ptr)
##               result <- createArray(ret)
##               return (result)
##           })

setMethod("log10", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_log10", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("log1p", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_log1p", x@ptr)
              result <- createArray(ret)
              return (result)
          })

## Exponential functions
##########################
setGeneric("erf", function(x) standardGeneric("erf"))
setGeneric("erfc", function(x) standardGeneric("erfc"))
#setGeneric("erfinv", function(x) standardGeneric("erfinv"))
#setGeneric("lgamma", function(x) standardGeneric("lgamma"))

setMethod("exp", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_exp", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("expm1", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_expm1", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("erf", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_erf", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("erfc", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_erfc", x@ptr)
              result <- createArray(ret)
              return (result)
          })

## setMethod("erfinv", signature(x="afArray"),
##           function(x) {
##               ret = .Call("afr_erfinv", x@ptr)
##               result <- createArray(ret)
##               return (result)
##           })

setMethod("gamma", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_tgamma", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("lgamma", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_lgamma", x@ptr)
              result <- createArray(ret)
              return (result)
          })

## Numerical functions
######################

setMethod("sqrt", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_sqrt", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("abs", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_abs", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("round", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_round", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("ceiling", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_ceil", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("floor", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_floor", x@ptr)
              result <- createArray(ret)
              return (result)
          })

## Complex functions
####################

setMethod("Re", signature(z="afArray"),
          function(z) {
              ret = .Call("afr_real", z@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("Im", signature(z="afArray"),
          function(z) {
              ret = .Call("afr_imag", z@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("Conj", signature(z="afArray"),
          function(z) {
              ret = .Call("afr_conjg", z@ptr)
              result <- createArray(ret)
              return (result)
          })
