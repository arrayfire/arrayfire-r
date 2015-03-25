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

## setMethod("trunc", signature(x="afArray"),
##           function(x) {
##               ret = .Call("afr_trunc", x@ptr)
##               result <- createArray(ret)
##               return (result)
##           })

## setMethod("sign", signature(x="afArray"),
##           function(x) {
##               ret = .Call("afr_sign", x@ptr)
##               result <- createArray(ret)
##               return (result)
##           })

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
