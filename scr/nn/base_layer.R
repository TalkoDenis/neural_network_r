library(R6)

BaseLayer <- R6Class("BaseLayer",
  public = list(
    forward = function(){
      stop("This metod is abstract!")
    }
    backward = function(){
      stop("This metod is abstract!")
    }
  )
)
