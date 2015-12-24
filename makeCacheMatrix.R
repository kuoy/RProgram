# R Programing Assignment 2
## The makeCacheMatrix function contains the information of a matrix and its existing 
## inverse matrix in a global environment.  The makeCacheMatrix function contains of four ## children functions in a list format, explained below: 

## (1) the set function stores the data of either its original matrix or a new assigned matrix. Its inverse matrix is set as NULL because no inverse matrix attained yet.
## (2) the get function displays the stored matrix data
## (3) the setinvmatrix function stores the data of the inverse matrix m from the cacheSolve function  
## (4) the getinvmatrix function displays the data of the stored inverse matrix m ##

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

