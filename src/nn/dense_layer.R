source("src/nn/base_layer.R")

DenseLayer <- R6Class("DenseLayer",
  inherit = BaseLayer,
  public = list(
    weights = NULL,
    biases = NULL,
    inputs = NULL,
    
    initialize = function(input_size, output_size) {
      stopifnot("Input_size must be a number" = is.numeric(input_size))
      stopifnot("Output_size must be a number" = is.numeric(output_size))
      
      self$weights <- matrix(rnorm(input_size * output_size), nrow = input_size, ncol = output_size)
      self$biases <- matrix(rnorm(output_size), nrow = 1, ncol = output_size) 
    },

    forward = function(input_data) {
      stopifnot("Input must be a number" = is.numeric(input_data))
      stopifnot("Input must be a matrix" = is.matrix(input_data))
      
      self$inputs <- input_data
      xw <- self$inputs %*% self$weights
      batch_size <- nrow(self$inputs)
      ones_vector <- matrix(1, nrow=batch_size, ncol=1)
      
      output_variable <- xw + (ones_vector %*% self$biases) 
      return(output_variable)      
    },

    backward = function(output_gradient, learning_rate) {
      stopifnot("Learning rate must be a number" = is.numeric(learning_rate))
      stopifnot("Gradient must be a matrix" = is.matrix(output_gradient))
      
      dW <- t(self$inputs) %*% output_gradient
      dX <- output_gradient %*% t(self$weights)
      dB <- matrix(colSums(output_gradient), nrow=1)
      self$weights <- self$weights- (learning_rate * dW)
      self$biases <- self$biases - (learning_rate * dB)
      return(dX)
    }
  )
)
