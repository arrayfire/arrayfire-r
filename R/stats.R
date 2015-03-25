setGeneric("sd", function(x) standardGeneric("sd"))
setMethod("sd", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_stdev", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setGeneric("var", function(x) standardGeneric("var"))
setMethod("var", signature(x="afArray"),
          function(x) {
              ret = .Call("afr_var", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setGeneric("cov", function(x,y) standardGeneric("cov"))
setMethod("cov", signature(x="afArray", y="ANY"),
          function(x, y=NULL) {
              if (y == NULL) {
                  ret = .Call("afr_var", x@ptr)
              } else {
                  ret = .Call("afr_cov2", x@ptr, y@ptr)
              }
              result <- createArray(ret)
              return (result)
          })
