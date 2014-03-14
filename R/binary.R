## (Array, Array) operations
############################

setMethod("+", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("af_add_aa", e1@ptr, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("-", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("af_sub_aa", e1@ptr, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("*", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("af_mul_aa", e1@ptr, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("/", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("af_div_aa", e1@ptr, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("<", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("af_lt_aa", e1@ptr, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("<=", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("af_le_aa", e1@ptr, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod(">", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("af_gt_aa", e1@ptr, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod(">=", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("af_ge_aa", e1@ptr, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("==", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("af_eq_aa", e1@ptr, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("!=", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("af_ne_aa", e1@ptr, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("^", signature(e1="afArray", e2="afArray"),  function(e1, e2) {
    ret = .Call("af_pow_aa", e1@ptr, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("%%", signature(e1="afArray", e2="afArray"),  function(e1, e2) {
    ret = .Call("af_mod_aa", e1@ptr, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

## (Array, numeric) operations
##############################

setMethod("+", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("af_add_an", e1@ptr, e2)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("-", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("af_sub_an", e1@ptr, e2)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("*", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("af_mul_an", e1@ptr, e2)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("/", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("af_div_an", e1@ptr, e2)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("<", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("af_lt_an", e1@ptr, e2)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("<=", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("af_le_an", e1@ptr, e2)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod(">", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("af_gt_an", e1@ptr, e2)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod(">=", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("af_ge_an", e1@ptr, e2)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("==", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("af_eq_an", e1@ptr, e2)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("!=", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("af_ne_an", e1@ptr, e2)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("^", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("af_pow_an", e1@ptr, e2)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("%%", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("af_mod_an", e1@ptr, e2)
    result <- new("afArray", ptr=ret)
    return (result)
})

## (Numeric, Array) operations
##############################

setMethod("+", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("af_add_na", e1, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("-", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("af_sub_na", e1, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("*", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("af_mul_na", e1, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("/", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("af_div_na", e1, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("<", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("af_lt_na", e1, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("<=", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("af_le_na", e1, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod(">", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("af_gt_na", e1, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod(">=", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("af_ge_na", e1, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("==", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("af_eq_na", e1, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("!=", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("af_ne_na", e1, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("^", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("af_pow_na", e1, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

setMethod("%%", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("af_mod_na", e1, e2@ptr)
    result <- new("afArray", ptr=ret)
    return (result)
})

## Non symbolic binary operators
################################
setGeneric("Cplx", function(real, imag) standardGeneric("Cplx"))
setGeneric("hypot", function(x, y) standardGeneric("hypot"))

setMethod("Cplx", signature("afArray", "afArray"),
          function(real, imag) {
              ret = .Call("af_complex_aa", real@ptr, imag@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("Cplx", signature("afArray", "numeric"),
          function(real, imag=0) {
              ret = .Call("af_complex_an", real@ptr, imag)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("Cplx", signature("numeric", "afArray"),
          function(real=0, imag) {
              ret = .Call("af_complex_na", real, imag@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("atan2", signature(y="afArray", x="afArray"),
          function(y, x) {
              ret = .Call("af_atan2_aa", y@ptr, x@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("atan2", signature(y="afArray", x="numeric"),
          function(y, x) {
              ret = .Call("af_atan2_an", y@ptr, x)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("atan2", signature(y="numeric", x="afArray"),
          function(y, x) {
              ret = .Call("af_atan2_na", x, y@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("hypot", signature("afArray", "afArray"),
          function(x, y) {
              ret = .Call("af_hypot_aa", x@ptr, y@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("hypot", signature("afArray", "numeric"),
          function(x, y) {
              ret = .Call("af_hypot_an", x@ptr, y)
              result <- new("afArray", ptr=ret)
              return (result)
          })

setMethod("hypot", signature("numeric", "afArray"),
          function(x, y) {
              ret = .Call("af_hypot_na", x, y@ptr)
              result <- new("afArray", ptr=ret)
              return (result)
          })
