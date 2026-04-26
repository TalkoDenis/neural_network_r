sourse("src/nn/base_layer.R")

ActivationReLU <- R6Class("ActivationReLU",
  inherit = BaseLayer,
  public = list(
    forward = function() {
    },

    backward = function( ) {
    }
  )
)
