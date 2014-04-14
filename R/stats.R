setGeneric("sd", function(x) standardGeneric("sd"))
setMethod("sd", signature(x="afArray"),
          function(x) {
              ret = .Call("af_stdev", x@ptr)
              result <- createArray(ret)
              return (result)
          })

setGeneric("cov", function(x,y) standardGeneric("cov"))
setMethod("cov", signature(x="afArray", y="ANY"),
          function(x, y=NULL) {
              if (y == NULL) {
                  ret = .Call("af_cov", x@ptr)
              } else {
                  ret = .Call("af_cov2", x@ptr, y@ptr)
              }
              result <- createArray(ret)
              return (result)
          })

setGeneric("var", function(x, y) standardGeneric("var"))
setMethod("var", signature(x="afArray", y="ANY"),
          function(x, y=NULL) {
              if (y == NULL) {
                  ret = .Call("af_var", x@ptr)
              } else {
                  ret = .Call("af_var2", x@ptr, y@ptr)
              }
              result <- createArray(ret)
              return (result)
          })


