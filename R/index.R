## indexing for afArray
#######################

getIndices <- function(...) {
    indices <- list(...)
    if (length(indices > 0)) {
        stop("Indexing supported for first two dimensions only")
    }
    return (indices)
}

setMethod("[", signature(x="afArray", i="afArray", j="afArray"),
          function(x, i, j, ...) {
              indices <- getIndices(...)

              if (missing(i)) {
                  ret =.Call("afr_get_sass", x@ptr, 0, j@ptr)
              }

              if (missing(j)) {
                  ret =.Call("afr_get_asss", x@ptr, i@ptr, 0)
              }
              ret = .Call("afr_get_aass", x@ptr, i@ptr, j@ptr)
              result = createArray(ret)
              return (result)
          })

setMethod("[", signature(x="afArray", i="numeric", j="afArray"),
          function(x, i, j, ...) {
              indices <- getIndices(...)

              if (missing(i)) {
                  ret =.Call("afr_get_sass", x@ptr, 0, j@ptr)
              } else {
                  i = as.integer(i)
              }

              if (missing(j)) {
                  ret =.Call("afr_get_nsss", x@ptr, i, 0)
              }

              ret = .Call("afr_get_nass", x@ptr, i, j@ptr)
              result = createArray(ret)
              return (result)
          })

setMethod("[", signature(x="afArray", i="afArray", j="numeric"),
          function(x, i, j, ...) {
              indices <- getIndices(...)

              if (missing(j)) {
                  ret =.Call("afr_get_asss", x@ptr, i@ptr, 0)
              } else {
                  j = as.integer(j)
              }

              if (missing(i)) {
                  ret =.Call("afr_get_snss", x@ptr, 0, j)
              }

              ret = .Call("afr_get_anss", x@ptr, i@ptr, j)
              result = createArray(ret)
              return (result)
          })

setMethod("[", signature(x="afArray", i="ANY", j="ANY"),
          function(x, i, j=1, ...) {
              indices <- getIndices(...)

              if (missing(i)) { i = 0 }

              i = as.integer(i)
              j = as.integer(j)

              if (sum(i) == 0) {
                  ret = .Call("afr_get_snss", x@ptr, 0, j)
              } else {
                  ret = .Call("afr_get_nnss", x@ptr, i, j)
              }

              result = createArray(ret)
              return (result)
          })

setMethod("[<-", signature(x="afArray", i="afArray", j="afArray"),
          function(x, i, j, ..., value) {
              indices <- getIndices(...)
              if (class(value) != "afArray") { stop ("value parameter must be afArray") }

              if (missing(i)) {
                  ret =.Call("afr_set_sass", x@ptr, value@ptr, 0, j@ptr)
              }

              if (missing(j)) {
                  ret =.Call("afr_set_asss", x@ptr, value@ptr, i@pr, 0)
              }

              ret = .Call("afr_set_aass", x@ptr, value@ptr, i@ptr, j@ptr)
              result = createArray(ret)
              return (result)
          })

setMethod("[<-", signature(x="afArray", i="numeric", j="afArray"),
          function(x, i, j, ..., value) {
              indices <- getIndices(...)
              if (class(value) != "afArray") { stop ("value parameter must be afArray") }

              if (missing(i)) {
                  ret =.Call("afr_set_sass", x@ptr, value@ptr, 0, j@ptr)
              } else {
                  i = as.integer(i)
              }

              if (missing(j)) {
                  ret =.Call("afr_set_nsss", x@ptr, value@ptr, i, 0)
              }

              ret = .Call("afr_set_nass", x@ptr, value@ptr, i, j@ptr)
              result = createArray(ret)
              return (result)
          })

setMethod("[<-", signature(x="afArray", i="afArray", j="numeric"),
          function(x, i, j, ..., value) {
              indices <- getIndices(...)
              if (class(value) != "afArray") { stop ("value parameter must be afArray") }

              if (missing(j)) {
                  ret =.Call("afr_set_asss", x@ptr, value@ptr, i@ptr, 0)
              } else {
                  j = as.integer(j)
              }

              if (missing(i)) {
                  ret =.Call("afr_set_snss", x@ptr, value@ptr, 0, j)
              }

              ret = .Call("afr_set_anss", x@ptr, value@ptr, i@ptr, j)
              result = createArray(ret)
              return (result)
          })

setMethod("[<-", signature(x="afArray", i="ANY", j="ANY"),
          function(x, i, j=1, ..., value) {
              indices <- getIndices(...)
              if (class(value) != "afArray") { stop ("value parameter must be afArray") }

              if (missing(i)) { i = 0 }

              i = as.integer(i)
              j = as.integer(j)

              if (sum(i) == 0) {
                  ret = .Call("afr_set_snss", x@ptr, value@ptr, 0, j)
              } else {
                  ret = .Call("afr_set_nnss", x@ptr, value@ptr, i, j)
              }

              result = createArray(ret)
              return (result)
          })
