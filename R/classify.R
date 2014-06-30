setGeneric("afKNN1", function(train, test, cl) standardGeneric("afKNN1"))

setMethod("afKNN1", signature(train="afArray", test="afArray", cl="afArray"),
          function(train, test, cl) {
              ret = .Call("af_knn1", train@ptr, test@ptr, cl@ptr)
              result <- createArray(ret)
              return(result)
          })
