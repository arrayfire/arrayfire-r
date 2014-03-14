## Trigonometric functions
###########################

setMethod("sin", signature(x="afArray"),
          function(x) {
              ret = .Call("af_sin", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("cos", signature(x="afArray"),
          function(x) {
              ret = .Call("af_cos", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("tan", signature(x="afArray"),
          function(x) {
              ret = .Call("af_tan", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("asin", signature(x="afArray"),
          function(x) {
              ret = .Call("af_asin", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("acos", signature(x="afArray"),
          function(x) {
              ret = .Call("af_acos", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("atan", signature(x="afArray"),
          function(x) {
              ret = .Call("af_atan", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

## Hyperbolic functions
###########################

setMethod("sinh", signature(x="afArray"),
          function(x) {
              ret = .Call("af_sinh", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("cosh", signature(x="afArray"),
          function(x) {
              ret = .Call("af_cosh", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("tanh", signature(x="afArray"),
          function(x) {
              ret = .Call("af_tanh", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("asinh", signature(x="afArray"),
          function(x) {
              ret = .Call("af_asinh", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("acosh", signature(x="afArray"),
          function(x) {
              ret = .Call("af_acosh", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("atanh", signature(x="afArray"),
          function(x) {
              ret = .Call("af_atanh", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

## Logarithmic functions
#########################

setMethod("log", signature(x="afArray"),
          function(x) {
              ret = .Call("af_log", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("log2", signature(x="afArray"),
          function(x) {
              ret = .Call("af_log2", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("log10", signature(x="afArray"),
          function(x) {
              ret = .Call("af_log10", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("log1p", signature(x="afArray"),
          function(x) {
              ret = .Call("af_log1p", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

## Exponential functions
##########################
setGeneric("erf", function(x) standardGeneric("erf"))
setGeneric("erfc", function(x) standardGeneric("erfc"))
setGeneric("erfinv", function(x) standardGeneric("erfinv"))
setGeneric("gammaln", function(x) standardGeneric("gammaln"))

setMethod("exp", signature(x="afArray"),
          function(x) {
              ret = .Call("af_exp", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("expm1", signature(x="afArray"),
          function(x) {
              ret = .Call("af_expm1", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("erf", signature(x="afArray"),
          function(x) {
              ret = .Call("af_erf", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("erfc", signature(x="afArray"),
          function(x) {
              ret = .Call("af_erfc", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("erfinv", signature(x="afArray"),
          function(x) {
              ret = .Call("af_erfinv", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("gamma", signature(x="afArray"),
          function(x) {
              ret = .Call("af_gamma", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("gammaln", signature(x="afArray"),
          function(x) {
              ret = .Call("af_gammaln", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

## Numerical functions
######################

setMethod("sqrt", signature(x="afArray"),
          function(x) {
              ret = .Call("af_sqrt", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("abs", signature(x="afArray"),
          function(x) {
              ret = .Call("af_abs", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("round", signature(x="afArray"),
          function(x) {
              ret = .Call("af_round", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("ceiling", signature(x="afArray"),
          function(x) {
              ret = .Call("af_ceil", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("floor", signature(x="afArray"),
          function(x) {
              ret = .Call("af_floor", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("trunc", signature(x="afArray"),
          function(x) {
              ret = .Call("af_trunc", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("sign", signature(x="afArray"),
          function(x) {
              ret = .Call("af_sign", x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

## Complex functions
####################

setMethod("Re", signature(z="afArray"),
          function(z) {
              ret = .Call("af_real", z@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("Im", signature(z="afArray"),
          function(z) {
              ret = .Call("af_imag", z@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("Conj", signature(z="afArray"),
          function(z) {
              ret = .Call("af_conjg", z@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })
