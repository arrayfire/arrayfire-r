#include <stdio.h>
#include "R_wrapper.h"
using namespace af;

// Calculate all the distances from testing set to training set
array distance(array train, array test)
{
    const int feat_len = train.dims(1);
    const int num_train = train.dims(0);
    const int num_test  =  test.dims(0);
    array dist = constant(0, num_train, num_test);

    // Iterate over each attribute
    for (int ii = 0; ii < feat_len; ii++) {
        // Get a attribute vectors
        array train_i = train(span, ii);
        array test_i  = test (span, ii).T();

        // Tile the vectors to generate matrices
        array train_tiled = tile(train_i, 1,   num_test);
        array test_tiled  = tile( test_i, num_train, 1 );

        // Add the distance for this attribute
        array df = train_tiled - test_tiled;
        dist = dist + df * df;
        af::eval(dist);
    }
    return dist;
}

array knn1(array &train_feats, array &test_feats, array &train_labels)
{
    // Find distances between training and testing sets
    array dist = distance(train_feats, test_feats);

    // Find the neighbor producing the minimum distance
    array val, idx;
    min(val, idx, dist);

    // Return the labels
    return train_labels(idx.as(f32)).T();
}

EXTERNC af_knn1(SEXP trainFeats, SEXP testFeats, SEXP trainLabels)
{
    try {
        array *train_feats  = getPtr(trainFeats);
        array *test_feats   = getPtr( testFeats);
        array *train_labels = getPtr(trainLabels);

        array *means =  new array();
        *means = knn1(*train_feats, *test_feats, *train_labels);
        return getSEXP(means);

    } catch (af::exception &ex) {
        error_return(ex.what());
    }
}
