source("src/nn/sigmoid.R")
source("src/nn/base_layer.R")
source("src/nn/dense_layer.R")
source("src/nn/relu.R")
source("src/nn/mse.R")
source("src/nn/network.R")
source("src/visualization.R")
source("src/data.R")
source("src/train_loop.R")
source("src/pipeline.R")
source("src/cli.R")

config <- parse_cli_args()

run_pipeline(
  file_path = config$file,
  target_column = config$target.
  split_ratio = config$split,
  should_plot = config$plot,
  loss_type = config$loss
)
