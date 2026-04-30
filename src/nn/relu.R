source("src/nn/base_layer.R")

ActivationReLU <- R6Class("ActivationReLU",
  inherit = BaseLayer,
  public = list(
    inputs = NULL,
    
    forward = function(input_data) {
      stopifnot("Input must be a matrix" = is.matrix(input_data))
      
      self$inputs <- input_data
      output_data <- input_data
      output_data[output_data < 0] <- 0
      return(output_data)
    },

    backward = function(output_gradient, learning_rate=NULL) {
      stopifnot("Gradient must be a matrix" = is.matrix(output_gradient))

      dX <- output_gradient
      dX[self$inputs <= 0] <- 0
      return(dX)
    }
  )
)
