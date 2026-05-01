library(testthat)

source("src/nn/base_layer.R")
source("src/nn/dense_layer.R")

test_that("Dense Layer matrix dimensions are correct", {
  layer <- DenseLayer$new(input_size=2, output_size=3)
  input_data <- matrix(1, nrow=4, ncol=2)
  output_data <- layer$forward(input_data)
  expect_equal(dim(output_data), c(4, 3))

  incoming_grad <- matrix(1, nrow=4, ncol=3)
  outgoing_grad <- layer$backward(incoming_grad, learning_rate=0.1)
  expect_equal(dim(outgoing_grad), c(4, 2))
})
