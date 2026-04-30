library(R6)

Network <- R6Class("Network",
  public = list(
    layers = list(),

    add = function(layer) {
      stopifnot("Added object must be a layer" = inherits(layer, "BaseLayer"))
      
      self$layers <- append(self$layers, layer)
    },

    forward = function(input_data) {
      stopifnot("Input must be a matrix" = is.matrix(input_data))
    
      output <- input_data
      for (layer in self$layers) {
        output <- layer$forward(output)
      }
      return(output)
    },

    backward = function(loss_gradient, learning_rate) {
      stopifnot("Gradient must be a matrix" = is.matrix(loss_gradient))

      grad <- loss_gradient
      for (i in length(self$layers):1) {
        layer <- self$layers[[i]]
        grad <- layer$backward(grad, learning_rate)
      }
      return(grad)
    }
  )  
)
