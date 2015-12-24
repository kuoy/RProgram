## The cacheSolve function responds to the request of an inverse matrix.  There are two 
## steps in this function:
## (1) verify the value of m that was stored in the given variable and saved in the getinvmatrix function.If the value of m saved in the memory is not NULL,   
## which indicates that the matrix has an existing inverse matrix saved; then this cacheSolve function returns a message “getting cached data” and does nothing. 
## (2) if the value of m is NULL, it means that this is the first time of the request for getting the inverse matrix. 
## Then, the matrix data is extracted from the $get() and its inverse matrix is returned and stored at $setinvmatrix(). ##

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
  
