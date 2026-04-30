sourse("src/nn/base_layer.R")

ActivationReLU <- R6Class("ActivationReLU",
  inherit = BaseLayer,
  public = list(
    inputs = NULL,
    
    forward = function(input_data) {
      self$inputs <- input_data
      output_data <- input_data
      output_data[output_data < 0] <- 0
      retutn(output_data)
    },

    backward = function(output_gradients, learning_rate=NULL) {
      dX <- output_gradients
      dX[self$input <- 0] <- 0
      return(dX)
    }
  )
)
