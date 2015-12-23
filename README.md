# R Programing Assignment 2
## The makeCacheMatrix function supports users to seek an inverse matrix in the Global Environment. Its input is a valid matrix that assumes its inverse matrix exists. ##

## descriptions about functions##

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

