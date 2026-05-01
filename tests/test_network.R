library(testthat)

source("src/nn/base_layer.R")
source("src/nn/dense_layer.R")
source("src/nn/network.R")

test_that("Network can add layers and process data", {
  net <- Network$new()

  net$add(DenseLayer$new(input_size=2, output_size=5))
  expect_equal(length(net$layers), 1)

  input_data <- matrix(1, nrow=1, ncol=2)
  output_data <- net$forward(input_data)
  expect_equal(dim(output_data), c(1, 5))
})
