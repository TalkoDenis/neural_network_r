source("src/nn/sigmoid.R")
source("src/nn/base_layer.R")
source("src/nn/dense_layer.R")
source("src/nn/relu.R")
source("src/nn/mse.R")
source("src/nn/network.R")
source("src/visualization.R")

X <- matrix(c(0,0,
              0,1,
              1,0,
              1,1), ncol=2, byrow=TRUE)

Y <- matrix(c(0,
              1,
              1,
              0), ncol=1)

net <- Network$new()
net$add(DenseLayer$new(input_size=2, output_size=4))
net$add(ActivationReLU$new())
net$add(DenseLayer$new(input_size=4, output_size=1))
net$add(ActivationSigmoid$new())

loss_fn <- MSELoss$new()
learning_rate <- 0.1
epochs <- 1000
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

plot_loss(loss_history)
