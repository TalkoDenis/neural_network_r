library(testthat)

source("src/nn/base_layer.R")
source("src/nn/relu.R")

test_that("ReLU Forward Pass sets negative numbers to zero", {
  relu <- ActivationReLU$new()

  input_data <- matrix(c(-5, 0, 3, -1), nrow=2)
  expected_output <- matrix(c(0, 0, 3, 0), nrow=2)

  actual_output <- relu$forward(input_data)
  expect_equal(actual_output, expected_output)
})

test_that("ReLU Backward Pass zeros out gradients where input was <= 0", {
  relu <- ActivationReLU$new()
  input_data <- matrix(c(-5, 0, 3, -1), nrow=2)
  relu$forward(input_data)

  incoming_gradient <- matrix(c(10, 10, 10, 10), nrow=2)
  expected_gradient <- matrix(c(0, 0, 10, 0), nrow=2)

  actual_gradient <- relu$backward(incoming_gradient)
  expect_equal(actual_gradient, expected_gradient)
})
