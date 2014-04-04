library(methods)
library(parallel)
library(arrayfire)

piR <- function(num) {
    x <- runif(num)
    y <- runif(num)
    val = 4.0 * (sum((x*x + y*y) < 1)) / num
    return (val)
}

piAF <- function(num) {
    x <- afRunif(num)
    y <- afRunif(num)
    val = 4.0 * (sum((x*x + y*y) < 1)) / num
    afEval(val)
    return (val)
}

piAFDouble <- function(num) {
    x <- afRunif(num, 0, 1, "double")
    y <- afRunif(num, 0, 1, "double")
    val = 4.0 * (sum((x*x + y*y) < 1)) / num
    afEval(val)
    return (val)
}

piBench <- function(num, iter, fn, sync=FALSE) {
    start <- Sys.time()
    for (i in 1:iter) {
        fn(num)
    }
    if (sync == TRUE) {
        afSync()
    }
    end <- Sys.time()
    elapsed <- difftime(end, start)
    return (elapsed)
}

num = 10000000
print("R (Double precision) Result: ")
res = piR(num)
print(res)

print("AF Single precision Result: ")
res = piAF(num)
afPrint(res)

print("AF Double precision Result: ")
res = piAFDouble(num)
afPrint(res)

print("R (Double precision) time: ")
piBench(num, 5, piR)

print("AF Single precision time: ")
piBench(num, 5, piAF, TRUE)

print("AF Double precision time: ")
piBench(num, 5, piAFDouble, TRUE)

