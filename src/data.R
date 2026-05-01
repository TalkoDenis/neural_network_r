get_xor_data <- function() {
  X <- matrix(c(0,0,
                0,1,
                1,0,
                1,1), ncol=2, byrow=TRUE)

  Y <- matrix(c(0,
                1,
                1,
                0), ncol=1)
  return(list(X=X, Y=Y))
}
