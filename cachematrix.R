##This function, makeCacheMatrix creates a matrix, which is a list containing a function to: 
##set the value of the matrix, get the value of the matrix, set the value of the inverse and get the value of the inverse

makeCacheMatrix<- function(x=matrix()) {
  
  inve<- NULL
  set<- function(y) {
    x<<-y
    inve<<- NULL
  }
  
get<- function() x
setInverse<- function(inverse) inve<<- inverse 
getInverse<- function() inve
list(set=Set,get=get, setInverse=setInverse, getInverse=getInverse)
}

##The following function calculates the inverse of the special matrix created with the above function.
##This function computes the inverse of the matrix returned by makeCacheMatrix above. If the inverse has already been calculated, 
##then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  inve <- x$getInverse()
  if (!is.null(inve)) {
    message("getting cached data")
    return(inve)
  }
  data <- x$get()
  inve <- solve(mat, ...)
  x$setInverse(inve)
  inve
}
