library(optparse)

source("src/nn/base_layer.R")
source("src/nn/dense_layer.R")
source("src/nn/relu.R")
source("src/nn/sigmoid.R")
source("src/nn/mse.R")
source("src/nn/network.R")
source("src/visualization.R")
source("src/data.R")
source("src/train_loop.R")
source("src/pipeline.R")

option_list <- list(
  make_option(c("-f", "--file"), type="character", default=NULL, help="Path to the dataset (.csv)"),
  make_option(c("-t", "--target"), type="character", default=NULL, help="Target column name"),
  make_option(c("-s", "--split"), type="numeric", default=0.7, help="Train/Test split ratio"),
  make_option(c("-p", "--plot"), action="store_true", default=FALSE, help="Generate a loss plot")
)

opt <- parse_args(OptionParser(option_list = option_list))

if (is.null(opt$file)) {
  cat("Running in development mode...\n")
  opt$file <- "data/dummy_data.csv"
  opt$target <- "target"
  opt$split <- 0.7
  opt$plot <- TRUE
}

run_pipeline(file_path = opt$file, 
             target_column = opt$target, 
             split_ratio = opt$split, 
             should_plot = opt$plot)
