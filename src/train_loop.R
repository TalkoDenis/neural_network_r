train_network <- function(net, X, Y, epochs=1000, learning_rate=0.1) {
  loss_fn <- MSELoss$new()
  loss_history <- numeric(epochs)

  cat("Starting training...\n")
  for (epoch in 1:epochs) {
    predictions <- net$forward(X)
    loss <- loss_fn$forward(predictions, Y)
    loss_history[epoch] <- loss
    grad <- loss_fn$backward(predictions, Y)
    net$backward(grad, learning_rate)

    if (epoch %% 100 == 0) {
      cat(sprintf("Epoch: %d | Loss %f\n", epoch, loss))
    }
  }

  cat("Training complete. Final Predictions:")
  print(net$forward(X))

  return(loss_history)
}
