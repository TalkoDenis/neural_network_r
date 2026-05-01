library(testthat)

source("src/nn/base_layer.R")
source("src/nn/mse.R")

test_that("MSE Forward Pass calculates the correct error", {
  loss_fn <- MSELoss$new()

  y_pred <- matrix(c(1, 2), ncol=1)
  y_true <- matrix(c(1, 4), ncol=1)
  expected_loss <- 2

  actual_loss <- loss_fn$forward(y_pred, y_true)
  expect_equal(actual_loss, expected_loss)
})

test_that("MSE Backward Pass calculates the correct gradient", {
  loss_fn <- MSELoss$new()

  y_pred <- matrix(c(1, 2), ncol=1)
  y_true <- matrix(c(1, 4), ncol=1)
  expected_gradient <- matrix(c(0, -2), ncol=1)

  actual_gradient <- loss_fn$backward(y_pred, y_true)

  expect_equal(actual_gradient, expected_gradient)
})
