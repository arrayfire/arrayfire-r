setMethod("sum", signature(x="afArray", na.rm="logical"),
          function(x, na.rm=0) {
              ret = .Call("af_sum", x@ptr, -1)
              result <- afArrayWrap(ret)
              return (result)
          })

setMethod("any", signature(x="afArray", na.rm="logical"),
          function(x, na.rm=0) {
              ret = .Call("af_anytrue", x@ptr, -1)
              result <- afArrayWrap(ret)
              return (result)
          })

setMethod("all", signature(x="afArray", na.rm="logical"),
          function(x, na.rm=0) {
              ret = .Call("af_alltrue", x@ptr, -1)
              result <- afArrayWrap(ret)
              return (result)
          })

setMethod("min", signature(x="afArray", na.rm="logical"),
          function(x, na.rm=0) {
              ret = .Call("af_min", x@ptr, -1)
              result <- afArrayWrap(ret)
              return (result)
          })

setMethod("max", signature(x="afArray", na.rm="logical"),
          function(x, na.rm=0) {
              ret = .Call("af_max", x@ptr, -1)
              result <- afArrayWrap(ret)
              return (result)
          })

setMethod("median", signature(x="afArray", na.rm="logical"),
          function(x, na.rm=0) {
              ret = .Call("af_median", x@ptr, -1)
              result <- afArrayWrap(ret)
              return (result)
          })

setMethod("sd", signature(x="afArray", na.rm="logical"),
          function(x, na.rm=0) {
              ret = .Call("af_stdev", x@ptr, -1)
              result <- afArrayWrap(ret)
              return (result)
          })
