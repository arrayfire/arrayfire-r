library("class")
library("methods")
library("arrayfire")
source("LoadMNIST.R")

accuracy <- function(predicted, expected) {
    ret <- as.numeric(sum(predicted == expected)) / dim(predicted)[1]
    ret
}

# Load data from disk
data <- loadMNIST()

# Push data to GPU
afTrainImages = afArray(data$trainImages)
afTestImages  = afArray(data$testImages)
afTrainLabels = afArray(data$trainLabels)

# Do the operation using native R method
res <- knn1(data$trainImages, data$testImages, data$trainLabels)
resLabels <- array(as.numeric(res) - 1)
print(accuracy(resLabels, data$testLabels))

# Do the operation using arrayfire
afResLabels <- afKNN1(afTrainImages, afTestImages, afTrainLabels)
afResLabelsHost <- afHost(afResLabels)
print(accuracy(afResLabelsHost, data$testLabels))
