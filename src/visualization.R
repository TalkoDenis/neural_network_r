plot_loss <- function(loss_history) {
  epochs <- length(loss_history)

  plot(1:epochs, loss_history, type="l", col="blue", lwd=2,
      main="Training loss over Epochs",
      xlab="Epochs",
      ylab="MSE Loss")
}
