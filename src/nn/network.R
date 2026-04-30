library(R6)

Network <- R6Class("Network",
  public = list(
    layers = list(),

    add = function(layer) {
      self$layers <- append(self$layers, layer)
    },

    forward = function(input_data) {
      output <- input_data
      for (layer in self$layers) {
        output <- layer$forward(output)
      }
      return(output)
    },

    backward = function(loss_gradient, learning_rate) {
      grad <- loss_gradient
      for (i in length(self$layers):1) {
        layer <- self$layers[[i]]
        grad <- layer$backward(grad, learning_rate)
      }
      return(grad)
    }
  )  
)
