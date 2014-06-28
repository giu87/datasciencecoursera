# Author: Giuliano Vesci


# Function: makeCacheMatrix
#   creates a special matrix object which can cache its inverse
# Params: x matrix
#   the matrix to be stored and inversed

makeCacheMatrix <- function(x = matrix()) {

  i <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


# Function: cacheSolve
#   compute the inverse of a matrix if not already in cache
# Params: x matrix
#   a special metrix created with makeCacheMatrix function

cacheSolve <- function(x, ...) {
  
  inverse <- x$getinverse()
  if(!is.null(inverse)){
    
    message("getting inverse from cache") 
    return(inverse)
  }
  
  data <- x$get()
  inverse <- solve(data, ...)
  x$setinverse(inverse)
  inverse
}
