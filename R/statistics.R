setGeneric("sd", function(x) standardGeneric("sd"))
setMethod("sd", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_stdev_all", x@ptr)
              return (ret)
          })

setGeneric("var", function(x) standardGeneric("var"))
setMethod("var", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_var_all", x@ptr)
              return (ret)
          })

setGeneric("cov", function(x,y) standardGeneric("cov"))
setMethod("cov", signature(x="afArray", y="ANY"),
          function(x, y=NULL) {
              if (y == NULL) {
                  ret = .Call("afr_var", x@ptr, 0)
              } else {
                  ret = .Call("afr_cov", x@ptr, y@ptr)
              }
              result <- createArray(ret)
              return (result)
          })

setGeneric("mean", function(x) standardGeneric("mean"))
setMethod("mean", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_mean_all", x@ptr)
              return (ret)
          })

setGeneric("median", function(x) standardGeneric("median"))
setMethod("median", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_median_all", x@ptr)
              return (ret)
          })

## Statistics along a dimension
###############################

setGeneric("dimSd", function(x) standardGeneric("dimSd"))
setMethod("dimSd", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_stdev", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setGeneric("dimVar", function(x) standardGeneric("dimVar"))
setMethod("dimVar", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_var", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setGeneric("dimMean", function(x, dim) standardGeneric("dimMean"))
setMethod("dimMean", signature(x="afArray", dim="numeric"),
          function(x, dim=1) {
              ret = .Call("afr_mean", x@ptr, dim-1)
              result <- createArray(ret)
              return (result)
          })

setGeneric("dimMedian", function(x, dim) standardGeneric("dimMedian"))
setMethod("dimMedian", signature(x="afArray", dim="numeric"),
          function(x, dim=1) {
              ret = .Call("afr_median", x@ptr, dim-1)
              result <- createArray(ret)
              return (result)
          })
