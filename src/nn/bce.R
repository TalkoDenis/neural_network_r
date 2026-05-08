library(R6)

BCELoss <- R6Class("BCELoss",
  public = list(
    forward = function(y_pred, y_true) {
      stopifnot("y_pred and y_true must have the same dimensions" = identical(dim(y_pred), dim(y_true))

      y_pred_clipped <- pmax(pmin(y_pred, 1 - 1e-7), 1e-7)

      error <- -mean(y_true * log(y_pred_clipped) + (1 - y_true) * log(1 - y_pred_clipped))
      return(error)
    },

    backward = function(y_pred, y_true) {
      stopifnot("y_pred and y_true must have the same dimensions" = identical(dim(y_pred), dim(y_true))

      y_pred_clipped <- pmax(pmin(y_pred, 1 - 1e-7), 1e-7)

      N <- length(y_true)

      gradient <- ((1 - y_true) / (1 - y_pred_clipped) - (y_true / y_pred_clipped)) / N
      return(gradient)
    }
  )
)
