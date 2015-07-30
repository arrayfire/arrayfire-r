library(methods)
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
    return (val)
}

piAFDouble <- function(num) {
    x <- afRunif(num, 0, 1, "double")
    y <- afRunif(num, 0, 1, "double")
    val = 4.0 * (sum((x*x + y*y) < 1)) / num
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
    elapsed <- difftime(end, start) / iter
    return (elapsed)
}

num = 10000000
print("CPU (Double precision) Result: ")
res = piR(num)
print(res)

print("ArrayFire (Single precision) Result: ")
res = piAF(num)
print(res)

print("ArrayFire (Double precision) Result: ")
res = piAFDouble(num)
print(res)

print("CPU (Double precision) time: ")
piBench(num, 5, piR)

print("ArrayFire (Single precision) time: ")
piBench(num, 5, piAF, TRUE)

print("ArrayFire (Double precision) time: ")
piBench(num, 5, piAFDouble, TRUE)
