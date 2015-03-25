## (Array, Array) operations
############################

setMethod("+", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_add_aa", e1@ptr, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod("-", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_sub_aa", e1@ptr, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod("*", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_mul_aa", e1@ptr, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod("/", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_div_aa", e1@ptr, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod("<", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_lt_aa", e1@ptr, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod("<=", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_le_aa", e1@ptr, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod(">", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_gt_aa", e1@ptr, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod(">=", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_ge_aa", e1@ptr, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod("==", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_eq_aa", e1@ptr, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod("!=", signature(e1="afArray", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_ne_aa", e1@ptr, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod("^", signature(e1="afArray", e2="afArray"),  function(e1, e2) {
    ret = .Call("afr_pow_aa", e1@ptr, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod("%%", signature(e1="afArray", e2="afArray"),  function(e1, e2) {
    ret = .Call("afr_mod_aa", e1@ptr, e2@ptr)
    result <- createArray(ret)
    return (result)
})

## (Array, numeric) operations
##############################

setMethod("+", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_add_an", e1@ptr, e2)
    result <- createArray(ret)
    return (result)
})

setMethod("-", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_sub_an", e1@ptr, e2)
    result <- createArray(ret)
    return (result)
})

setMethod("*", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_mul_an", e1@ptr, e2)
    result <- createArray(ret)
    return (result)
})

setMethod("/", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_div_an", e1@ptr, e2)
    result <- createArray(ret)
    return (result)
})

setMethod("<", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_lt_an", e1@ptr, e2)
    result <- createArray(ret)
    return (result)
})

setMethod("<=", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_le_an", e1@ptr, e2)
    result <- createArray(ret)
    return (result)
})

setMethod(">", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_gt_an", e1@ptr, e2)
    result <- createArray(ret)
    return (result)
})

setMethod(">=", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_ge_an", e1@ptr, e2)
    result <- createArray(ret)
    return (result)
})

setMethod("==", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_eq_an", e1@ptr, e2)
    result <- createArray(ret)
    return (result)
})

setMethod("!=", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_ne_an", e1@ptr, e2)
    result <- createArray(ret)
    return (result)
})

setMethod("^", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_pow_an", e1@ptr, e2)
    result <- createArray(ret)
    return (result)
})

setMethod("%%", signature(e1="afArray", e2="numeric"), function(e1, e2) {
    ret = .Call("afr_mod_an", e1@ptr, e2)
    result <- createArray(ret)
    return (result)
})

## (Numeric, Array) operations
##############################

setMethod("+", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_add_na", e1, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod("-", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_sub_na", e1, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod("*", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_mul_na", e1, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod("/", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_div_na", e1, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod("<", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_lt_na", e1, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod("<=", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_le_na", e1, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod(">", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_gt_na", e1, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod(">=", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_ge_na", e1, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod("==", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_eq_na", e1, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod("!=", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_ne_na", e1, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod("^", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_pow_na", e1, e2@ptr)
    result <- createArray(ret)
    return (result)
})

setMethod("%%", signature(e1="numeric", e2="afArray"), function(e1, e2) {
    ret = .Call("afr_mod_na", e1, e2@ptr)
    result <- createArray(ret)
    return (result)
})

## Non symbolic binary operators
################################
setGeneric("Cplx", function(real, imag) standardGeneric("Cplx"))
setGeneric("hypot", function(x, y) standardGeneric("hypot"))

setMethod("Cplx", signature("afArray", "afArray"),
          function(real, imag) {
              ret = .Call("afr_complex_aa", real@ptr, imag@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("Cplx", signature("afArray", "numeric"),
          function(real, imag=0) {
              ret = .Call("afr_complex_an", real@ptr, imag)
              result <- createArray(ret)
              return (result)
          })

setMethod("Cplx", signature("numeric", "afArray"),
          function(real=0, imag) {
              ret = .Call("afr_complex_na", real, imag@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("atan2", signature(y="afArray", x="afArray"),
          function(y, x) {
              ret = .Call("afr_atan2_aa", y@ptr, x@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("atan2", signature(y="afArray", x="numeric"),
          function(y, x) {
              ret = .Call("afr_atan2_an", y@ptr, x)
              result <- createArray(ret)
              return (result)
          })

setMethod("atan2", signature(y="numeric", x="afArray"),
          function(y, x) {
              ret = .Call("afr_atan2_na", x, y@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("hypot", signature("afArray", "afArray"),
          function(x, y) {
              ret = .Call("afr_hypot_aa", x@ptr, y@ptr)
              result <- createArray(ret)
              return (result)
          })

setMethod("hypot", signature("afArray", "numeric"),
          function(x, y) {
              ret = .Call("afr_hypot_an", x@ptr, y)
              result <- createArray(ret)
              return (result)
          })

setMethod("hypot", signature("numeric", "afArray"),
          function(x, y) {
              ret = .Call("afr_hypot_na", x, y@ptr)
              result <- createArray(ret)
              return (result)
          })
