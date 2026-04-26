library(R6)

BaseLayer <- R6Class("BaseLayer",
  public = list(
    forward = function(){
      stop("This method is abstract!")
    },
    backward = function(){
      stop("This method is abstract!")
    }
  )
)
