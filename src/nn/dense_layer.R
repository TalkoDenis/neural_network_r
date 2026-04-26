sourse("src/nn/base_layer.R")

DenseLayer <- R6Class("DenseLayer",
  inherit = BaseLayer,
  public = list(
    weights = NULL,
    biases = NULL,
    inputs = NULL,
    initialize = function(input_size, output_size) {
      self$weights <- matrix(rnorm(input_size * output_size), nrow = input_size, ncol = output_size)
      self$biases <- matrix(rnorm(output_size), nrow = 1, ncol = output_size) 
    },

    forward = function(input_data) {
      self$inputs <- input_data
      output_variable <- self$inputs %*% self$weights + self$biases
      return(output_variable)      
    },

    backward = function(output_gradient, learning_rate) {
      dW <- t(self$inputs) %*% output_gradient
      dX <- output_gradient %*% t(self$weights)
      dB <- matrix(colSums(output_gradient), nrow=1)
      self$weights <- self$weights- (learning_rate * dW)
      self$biases <- self$biases - (learning_rate * dB)
      return(dX)
    }
  )
)
