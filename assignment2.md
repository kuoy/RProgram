### Introduction
Assignment 2 is about buiding an R function in a global environment, which is able to cache an existing inverse matrix of a matrix.  
It includes two tasks: 
(1) Compute an R object of a matrix for its existing inverse matrix. 
(2) Cache the value of the existing inverse matrix so the user does not need to compute the inverse matrix if it exists.  

### makeCacheMatrix Function
##### The makeCacheMatrix function contains the information of a matrix and its existing inverse matrix in a global environment.  
The makeCacheMatrix function contains of four children functions in a list format, explained below: 

 (1) the set function stores the data of either its original matrix or a new assigned matrix. Its inverse matrix is set as NULL because no inverse matrix attained yet.
(2) the get function displays the stored matrix data
(3) the setinvmatrix function stores the data of the inverse matrix m from the cacheSolve function  
(4) the getinvmatrix function displays the data of the stored inverse matrix m

makeCacheMatrix<- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<-y
    m <<- NULL
  }
  get <- function() x
  setinvmatrix <- function (matrix) m <<-matrix
  getinvmatrix <- function() m
  list(set = set, get = get,
       setinvmatrix= setinvmatrix, 
       getinvmatrix = getinvmatrix)
}

### cacheSolve Function
##### The cacheSolve function responds to the request of an inverse matrix.  There are two steps in this function:
(1) verify the value of m that was stored in the given variable and saved in the getinvmatrix function.  If the value of m saved in the memory is not NULL, which indicates that the matrix has an existing inverse matrix saved; then this cacheSolve function returns a message “getting cached data” and does nothing. 
(2) if the value of m is NULL, it means that this is the first time of the request for getting the inverse matrix. Then, the matrix data is extracted from the $get() and its inverse matrix is returned and stored at $setinvmatrix(). 

cacheSolve <- function(x, ...) {
  m <- x$getinvmatrix()
  if(!is.null(m)) {
    message("getting cached inverse matrix data")
    return(m)
  }
  data <- x$get()
  
    m <- solve(data, ...)
    x$setinvmatrix(m)
    m  ## Return the inverse matrix of the giving matrix x
  }
  
### Example
##### Assign makeCacheMatrix to an object so the object has 4 elements on the list
#######> source("makeCacheMatrix.R")
#######> b<-makeCacheMatrix (x = matrix(c(1, 2, 3, 4), nrow=2, ncol=2))
#######> b$get()
     [,1] [,2]
[1,]    1    3
[2,]    2    4
> b$getinvmatrix()
NULL
> source("cacheSolve.R")
> cacheSolve(b)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> b$getinvmatrix()
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
