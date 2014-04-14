## Reduce entire array
########################

setMethod("sum", signature(x="afArray", na.rm="logical"),
          function(x, na.rm=0) {
              ret = .Call("af_sum", x@ptr, -1)
              result <- createArray(ret)
              return (result)
          })

setMethod("any", signature(x="afArray", na.rm="logical"),
          function(x, na.rm=0) {
              ret = .Call("af_anytrue", x@ptr, -1)
              result <- createArray(ret)
              return (result)
          })

setMethod("all", signature(x="afArray", na.rm="logical"),
          function(x, na.rm=0) {
              ret = .Call("af_alltrue", x@ptr, -1)
              result <- createArray(ret)
              return (result)
          })

setMethod("min", signature(x="afArray", na.rm="logical"),
          function(x, na.rm=0) {
              ret = .Call("af_min", x@ptr, -1)
              result <- createArray(ret)
              return (result)
          })

setMethod("max", signature(x="afArray", na.rm="logical"),
          function(x, na.rm=0) {
              ret = .Call("af_max", x@ptr, -1)
              result <- createArray(ret)
              return (result)
          })

setGeneric("mean", function(x) standardGeneric("mean"))
setMethod("mean", signature(x="afArray"),
          function(x) {
              ret = .Call("af_mean", x@ptr, -1)
              result <- createArray(ret)
              return (result)
          })

setGeneric("median", function(x) standardGeneric("median"))
setMethod("median", signature(x="afArray"),
          function(x) {
              ret = .Call("af_median", x@ptr, -1)
              result <- createArray(ret)
              return (result)
          })

## Reduce along dimension
#########################
setGeneric("dimSum", function(x, dim) standardGeneric("dimSum"))
setGeneric("dimMin", function(x, dim) standardGeneric("dimMin"))
setGeneric("dimMax", function(x, dim) standardGeneric("dimMax"))
setGeneric("dimAny", function(x, dim) standardGeneric("dimAny"))
setGeneric("dimAll", function(x, dim) standardGeneric("dimAll"))
setGeneric("dimMean", function(x, dim) standardGeneric("dimMean"))
setGeneric("dimMedian", function(x, dim) standardGeneric("dimMedian"))

setMethod("dimSum", signature(x="afArray", dim="numeric"),
          function(x, dim=1) {
              ret = .Call("af_sum", x@ptr, dim-1)
              result <- createArray(ret)
              return (result)
          })

setMethod("dimMin", signature(x="afArray", dim="numeric"),
          function(x, dim=1) {
              ret = .Call("af_min", x@ptr, dim-1)
              result <- createArray(ret)
              return (result)
          })

setMethod("dimMax", signature(x="afArray", dim="numeric"),
          function(x, dim=1) {
              ret = .Call("af_max", x@ptr, dim-1)
              result <- createArray(ret)
              return (result)
          })

setMethod("dimAny", signature(x="afArray", dim="numeric"),
          function(x, dim=1) {
              ret = .Call("af_any", x@ptr, dim-1)
              result <- createArray(ret)
              return (result)
          })

setMethod("dimAll", signature(x="afArray", dim="numeric"),
          function(x, dim=1) {
              ret = .Call("af_all", x@ptr, dim-1)
              result <- createArray(ret)
              return (result)
          })

setMethod("dimMean", signature(x="afArray", dim="numeric"),
          function(x, dim=1) {
              ret = .Call("af_mean", x@ptr, dim-1)
              result <- createArray(ret)
              return (result)
          })

setMethod("dimMedian", signature(x="afArray", dim="numeric"),
          function(x, dim=1) {
              ret = .Call("af_median", x@ptr, dim-1)
              result <- createArray(ret)
              return (result)
          })
