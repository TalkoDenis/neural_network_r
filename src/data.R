get_xor_data <- function() {
  X <- matrix(c(
    0, 0,
    0, 1,
    1, 0,
    1, 1
  ), ncol = 2, byrow = TRUE)

  Y <- matrix(c(
    0,
    1,
    1,
    0
  ), ncol = 1)
  return(list(X = X, Y = Y))
}

load_and_split_data <- function(file_path, target_column, split_ratio = 0.7) {
  if (!file.exists(file_path)) {
    stop(sprintf("Error: Cannot find the file '%s'", file_path))
  }
  df <- read.csv(file_path)
  
  if (!(target_column %in% names(df))) {
    stop(sprintf("Error: Target column '%s' not found in the dataset.", target_column))
  }
  
  X_df <- df[, names(df) != target_column, drop = FALSE]
  Y_df <- df[, target_column, drop = FALSE]
  
  X <- as.matrix(X_df)
  Y <- as.matrix(Y_df)
  
  total_rows <- nrow(X)
  shuffled_indices <- sample(1:total_rows)
  
  split_index <- floor(total_rows * split_ratio)
  
  train_indices <- shuffled_indices[1:split_index]
  test_indices <- shuffled_indices[(split_index + 1):total_rows]
  
  X_train <- X[train_indices, , drop = FALSE]
  Y_train <- Y[train_indices, , drop = FALSE]
  
  X_test <- X[test_indices, , drop = FALSE]
  Y_test <- Y[test_indices, , drop = FALSE]
  
  cat(sprintf("Data loaded: %d total rows. Training on %d rows, Testing on %d rows.\n", 
              total_rows, length(train_indices), length(test_indices)))
  
   return(list(
    X_train = X_train,
    Y_train = Y_train,
    X_test  = X_test,
    Y_test  = Y_test,
    input_size = ncol(X) 
  ))
}
