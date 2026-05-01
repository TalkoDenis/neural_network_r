library(testthat)

source("src/nn/base_layer.R")
source("src/nn/sigmoid.R")

test_that("Sigmoid Forward and Backward passes", {
  sig <- ActivationSigmoid$new()
  input_data <- matrix(0, nrow=1, ncol=1)
  expected_out <- matrix(0.5, nrow=1, ncol=1)
  expect_equal(sig$forward(input_data), expected_out)

  incoming_grad <- matrix(2, nrow=1, ncol=1)
  expected_grad <- matrix(0.5, nrow=1, ncol=1)
  expect_equal(sig$backward(incoming_grad), expected_grad)
})
