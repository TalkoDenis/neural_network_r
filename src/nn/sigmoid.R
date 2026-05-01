source("src/nn/base_layer.R")

ActivationSigmoid <- R6Class("ActivationSigmoid",
  inherit = BaseLayer,
  public = list(
    outputs = NULL,

    forward = function(input_data) {
      stopifnot("Input must be a matrix" = is.matrix(input_data))

      self$outputs <- 1 / (1 + exp(-input_data))
      return(self$outputs)   
    },

    backward = function(output_gradient, learning_rate=NULL) {
      stopifnot("Gradient must be a matrix" = is.matrix(output_gradient))

      dX <- output_gradient * (self$outputs * (1 - self$outputs))
      return(dX)
    }
  )
)
