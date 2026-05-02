source("src/nn/sigmoid.R")
source("src/nn/base_layer.R")
source("src/nn/dense_layer.R")
source("src/nn/relu.R")
source("src/nn/mse.R")
source("src/nn/network.R")
source("src/visualization.R")
source("src/data.R")
source("src/train_loop.R")

dataset <- get_xor_data()

net <- Network$new()
net$add(DenseLayer$new(input_size=2, output_size=4))
net$add(ActivationReLU$new())
net$add(DenseLayer$new(input_size=4, output_size=1))
net$add(ActivationSigmoid$new())

history <- train_network(net, dataset$X, dataset$Y, epochs=1000, learning_rate=0.1)

plot_loss(history)
