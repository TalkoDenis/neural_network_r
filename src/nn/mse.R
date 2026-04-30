library(R6)

MSELoss <- R6Class("MSELoss",
  public = list(
    forward = function(y_pred, y_true) {
      stopifnot("y_pred and y_true must have the same dimensions" = identical(dim(y_pred), dim(y_true)))
      
      error <- mean((y_true - y_pred)^2)
      return(error)
    },

    backward = function(y_pred, y_true) {
      stopifnot("y_pred and y_true must have the same dimensions" = identical(dim(y_pred), dim(y_true)))

      N <- length(y_true)
      gradient <- 2 * (y_pred - y_true) / N
      return(gradient)
    }
  )
)
