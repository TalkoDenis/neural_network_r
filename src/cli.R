ibrary(optparse)

option_list <- list(
  make_option(c("-f", "--file"), type="character", default=NULL, 
              help="Path to the dataset (.csv)"),
              
  make_option(c("-t", "--target"), type="character", default=NULL, 
              help="Name of the target column to predict"),
              
  make_option(c("-s", "--split"), type="numeric", default=0.7, 
              help="Train/Test split ratio [default: 0.7]"),
              
  make_option(c("-p", "--plot"), action="store_true", default=FALSE, 
              help="Generate and save a loss plot")
)

opt_parser <- OptionParser(option_list = option_list)
opt <- parse_args(opt_parser)

if (is.null(opt$file)) {
  cat("No file provided via CLI. Running in RStudio development mode...\n")
  opt$file <- "data/dummy_data.csv"
  opt$target <- "target_column"
  opt$split <- 0.7
  opt$plot <- TRUE
}

cat("--- Neural Network Configuration ---\n")
cat(sprintf("File: %s\n", opt$file))
cat(sprintf("Target: %s\n", opt$target))
cat(sprintf("Split Ratio: %f\n", opt$split))
cat(sprintf("Plotting: %s\n", as.character(opt$plot)))
cat("------------------------------------\n")

# TODO: Load data, build network, and train!
