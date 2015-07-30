## Reduce entire array
########################

setMethod("sum", signature(x="afArray", na.rm="logical"),
          function(x, na.rm=0) {
              ret = .Call("afr_sum_all", x@ptr)
              return (ret)
          })

setMethod("any", signature(x="afArray", na.rm="logical"),
          function(x, na.rm=0) {
              ret = .Call("afr_any_true_all", x@ptr)
              return (ret)
          })

setMethod("all", signature(x="afArray", na.rm="logical"),
          function(x, na.rm=0) {
              ret = .Call("afr_all_true_all", x@ptr)
              return (ret)
          })

setMethod("min", signature(x="afArray", na.rm="logical"),
          function(x, na.rm=0) {
              ret = .Call("afr_min_all", x@ptr)
              return (ret)
          })

setMethod("max", signature(x="afArray", na.rm="logical"),
          function(x, na.rm=0) {
              ret = .Call("afr_max_all", x@ptr)
              return (ret)
          })

## Reduce along dimension
#########################
setGeneric("dimSum", function(x, dim) standardGeneric("dimSum"))
setGeneric("dimMin", function(x, dim) standardGeneric("dimMin"))
setGeneric("dimMax", function(x, dim) standardGeneric("dimMax"))
setGeneric("dimAny", function(x, dim) standardGeneric("dimAny"))
setGeneric("dimAll", function(x, dim) standardGeneric("dimAll"))

setMethod("dimSum", signature(x="afArray", dim="numeric"),
          function(x, dim=1) {
              ret = .Call("afr_sum", x@ptr, dim-1)
              result <- createArray(ret)
              return (result)
          })

setMethod("dimMin", signature(x="afArray", dim="numeric"),
          function(x, dim=1) {
              ret = .Call("afr_min", x@ptr, dim-1)
              result <- createArray(ret)
              return (result)
          })

setMethod("dimMax", signature(x="afArray", dim="numeric"),
          function(x, dim=1) {
              ret = .Call("afr_max", x@ptr, dim-1)
              result <- createArray(ret)
              return (result)
          })

setMethod("dimAny", signature(x="afArray", dim="numeric"),
          function(x, dim=1) {
              ret = .Call("afr_any_true", x@ptr, dim-1)
              result <- createArray(ret)
              return (result)
          })

setMethod("dimAll", signature(x="afArray", dim="numeric"),
          function(x, dim=1) {
              ret = .Call("afr_all_true", x@ptr, dim-1)
              result <- createArray(ret)
              return (result)
          })
