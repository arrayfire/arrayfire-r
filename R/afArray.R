setClass("afArray", representation(ptr = "numeric", dims = "numeric"))

getTypeID <- function(type) {
    ty = -1
    if (type == "single") { ty = 0 }
    if (type == "complexFloat") { ty = 1 }
    if (type == "double") { ty = 2 }
    if (type == "complex") { ty = 3 }
    if (type == "logical") { ty = 4 }
    if (type == "integer") { ty = 5 }
    if (ty == -1) { stop("unsupported data type") }
    ty = as.integer(ty)
    return (ty)
}

afArray <- function(a, type="single") {
    atype = typeof(a)
    if (atype != "double" &&
        atype != "complex" ) { type = atype }

    if (atype == "complex" && type == "single") {
        type = "complexFloat"
    }

    ty = getTypeID(type)

    d = length(a)
    if (class(a) == "array" ||
        class(a) == "matrix") { d = dim(a) }
    else if (class(a) != "numeric") { stop("Input must be an array or numeric class") }

    arr <- .Call("af_array", a, d, ty)
    result <- new("afArray", ptr=arr)
    return (result)
}

## Generator functions
######################
afRunif <- function(dims, min=0, max=1, type="single") {
    if (class(dims) != "numeric") { stop("Dimensions must be numeric") }
    dims <- as.integer(dims)
    arr <- .Call("af_runif", dims, min, max, getTypeID(type))
    result <- new("afArray", ptr=arr)
    return (result)
}

afRnorm <- function(dims, mean=0, sd=1, type="single") {
    if (class(dims) != "numeric") { stop("Dimensions must be numeric") }
    dims <- as.integer(dims)
    arr <- .Call("af_rnorm", dims, mean, sd, getTypeID(type))
    result <- new("afArray", ptr=arr)
    return (result)
}

afConsts <- function(val, dims, type="single") {
    if (class(dims) != "numeric") { stop("Dimensions must be numeric") }
    dims <- as.integer(dims)
    arr <- .Call("af_consts", val, dims, getTypeID(type))
    result <- new("afArray", ptr=arr)
    return (result)
}

afHost <- function(a) {
    if (class(a) != "afArray") { return (a) }
    dims <- .Call("af_dims", a@ptr)
    result <- .Call("af_host", a@ptr)
    result <- array(result, dims)
    return (result)
}

## Utility functions
#####################
afInfo <- function() {
    result <- .Call("af_info_r")
    return (result)
}

afPrint <- function(A) {
    if (class(A) == "afArray") {
        result <- .Call("af_print", A@ptr)
    } else {
        result <- print(A)
    }
    return (result)
}

afSync <- function() {
    result <- .Call("af_sync_r")
    return (result)
}

afEval <- function(A) {
    result <- .Call("af_eval_r", A@ptr)
    return (result)
}
