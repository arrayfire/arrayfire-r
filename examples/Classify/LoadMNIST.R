# Stripped down version from here
# https://gist.github.com/brendano/39760

loadImageFile <- function(filename) {
    f = file(filename,'rb')
    readBin(f,'integer',n=1,size=4,endian='big')

    num = readBin(f,'integer',n=1,size=4,endian='big')
    nrow = readBin(f,'integer',n=1,size=4,endian='big')
    ncol = readBin(f,'integer',n=1,size=4,endian='big')
    x = readBin(f,'integer',n=num*nrow*ncol,size=1,signed=F)
    ret = matrix(x, ncol=nrow*ncol, byrow=T)
    close(f)
    ret
}

loadLabelFile <- function(filename) {
    f = file(filename,'rb')
    readBin(f,'integer',n=1,size=4,endian='big')
    n = readBin(f,'integer',n=1,size=4,endian='big')
    y = readBin(f,'integer',n=n,size=1,signed=F)
    ret = array(y)
    close(f)
    ret
}

loadMNIST <- function(ratio=0.6) {
    ret = list()
    images <- loadImageFile("mnist/images-subset")
    labels <- loadLabelFile("mnist/labels-subset")

    numSamples  <- dim(images)[1]
    featureSize <- dim(images)[2]

    randDist <- runif(numSamples)
    ratio <- 0.6

    trainIndices <- which(randDist <  ratio)
    ret$trainImages  <- images[trainIndices,]
    ret$trainLabels  <- labels[trainIndices]

    testIndices <- which(randDist >= ratio)
    ret$testImages  <- images[testIndices,]
    ret$testLabels  <- labels[testIndices]
    ret
}
