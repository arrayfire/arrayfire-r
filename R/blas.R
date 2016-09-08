## (Array, Array) operations
############################

setMethod("%*%", signature(x="afArray", y="afArray"), function(x, y) {
    ret = .Call("afr_matmul", x@ptr, y@ptr)
    result <- createArray(ret)
    return (result)
})

setGeneric("matmul", function(x, y) standardGeneric("matmul"))
setMethod("matmul", signature(x="afArray", y="afArray"), function(x, y) {
    ret = .Call("afr_matmul", x@ptr, y@ptr)
    result <- createArray(ret)
    return (result)
})

setGeneric("matmul_nt", function(x, y) standardGeneric("matmul_nt"))
setMethod("matmul_nt", signature(x="afArray", y="afArray"), function(x, y) {
    ret = .Call("afr_matmul_nt", x@ptr, y@ptr)
    result <- createArray(ret)
    return (result)
})

setGeneric("matmul_tt", function(x, y) standardGeneric("matmul_tt"))
setMethod("matmul_tt", signature(x="afArray", y="afArray"), function(x, y) {
    ret = .Call("afr_matmul_tt", x@ptr, y@ptr)
    result <- createArray(ret)
    return (result)
})

setGeneric("matmul_tn", function(x, y) standardGeneric("matmul_tn"))
setMethod("matmul_tn", signature(x="afArray", y="afArray"), function(x, y) {
    ret = .Call("afr_matmul_tn", x@ptr, y@ptr)
    result <- createArray(ret)
    return (result)
})

setGeneric("matmul_nct", function(x, y) standardGeneric("matmul_nct"))
setMethod("matmul_nct", signature(x="afArray", y="afArray"), function(x, y) {
    ret = .Call("afr_matmul_nct", x@ptr, y@ptr)
    result <- createArray(ret)
    return (result)
})

setGeneric("matmul_ctct", function(x, y) standardGeneric("matmul_ctct"))
setMethod("matmul_ctct", signature(x="afArray", y="afArray"), function(x, y) {
    ret = .Call("afr_matmul_ctct", x@ptr, y@ptr)
    result <- createArray(ret)
    return (result)
})

setGeneric("matmul_ctn", function(x, y) standardGeneric("matmul_ctn"))
setMethod("matmul_ctn", signature(x="afArray", y="afArray"), function(x, y) {
    ret = .Call("afr_matmul_ctn", x@ptr, y@ptr)
    result <- createArray(ret)
    return (result)
})

setGeneric("dot", function(x, y) standardGeneric("dot"))
setMethod("dot", signature(x="afArray", y="afArray"), function(x, y) {
    ret = .Call("afr_dot", x@ptr, y@ptr)
    result <- createArray(ret)
    return (result)
})

setGeneric("dot_nc", function(x, y) standardGeneric("dot_nc"))
setMethod("dot_nc", signature(x="afArray", y="afArray"), function(x, y) {
    ret = .Call("afr_dot_nc", x@ptr, y@ptr)
    result <- createArray(ret)
    return (result)
})

setGeneric("dot_cc", function(x, y) standardGeneric("dot_cc"))
setMethod("dot_cc", signature(x="afArray", y="afArray"), function(x, y) {
    ret = .Call("afr_dot_cc", x@ptr, y@ptr)
    result <- createArray(ret)
    return (result)
})

setGeneric("dot_cn", function(x, y) standardGeneric("dot_cn"))
setMethod("dot_cn", signature(x="afArray", y="afArray"), function(x, y) {
    ret = .Call("afr_dot_cn", x@ptr, y@ptr)
    result <- createArray(ret)
    return (result)
})

setGeneric("t", function(x) standardGeneric("t"))
setMethod("t", signature(x="afArray"), function(x) {
    ret = .Call("afr_transpose", x@ptr)
    result <- createArray(ret)
    return (result)
})
