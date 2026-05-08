run_pipeline <- function(file_path, target_column, split_ratio, should_plot) {
  dataset <- load_and_split_data(file_path = file_path, 
                                 target_column = target_column, 
                                 split_ratio = split_ratio)
  
  net <- Network$new()
  net$add(DenseLayer$new(input_size = dataset$input_size, output_size = 4))
  net$add(ActivationReLU$new())
  net$add(DenseLayer$new(input_size = 4, output_size = 1))
  net$add(ActivationSigmoid$new())
  
  history <- train_network(net, X = dataset$X_train, Y = dataset$Y_train, epochs = 1000, learning_rate = 0.1)
  
  cat("\n--- Evaluation on Hidden Test Data ---\n")
  test_predictions <- net$forward(dataset$X_test)
  loss_fn <- MSELoss$new()
  test_loss <- loss_fn$forward(test_predictions, dataset$Y_test)
  
  cat(sprintf("Final Test Loss: %f\n", test_loss))
  
  if (should_plot) {
    cat("\nGenerating plot...\n")
    plot_loss(history)
  }
}
