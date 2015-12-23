cacheSolve <- function(x, ...) {
  m <- x$getinvmatrix()
  if(!is.null(m)) {
    message("getting cached inverse matrix data")
    return(m)
  }
  data <- x$get()
  
    m <- solve(data, ...)
    x$setinvmatrix(m)
    m  
  }
  
