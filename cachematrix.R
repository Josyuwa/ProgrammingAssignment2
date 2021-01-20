setwd('C:/Users/rubind1/Documents/Coursera-R')
##
## Set the input x as a matrix
## and then set the obtained value "v" as a null
## then changed every reference to "mean" to "solve"
makeCacheMatrix <- function(x = matrix(sample(1:100,9),3,3)) {
  v <- NULL
  set <- function(y) {
    x <<- y
    v <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) v <<- solve
  getsolve <- function() v
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}
##
## Same goes here, I substituted the term "mean" to "solve" and "m" to "v"
cacheSolve <- function(x, ...) {
  v <- x$getsolve()
  if(!is.null(v)) {
    message("getting inversed matrix")
    return(v)
  }
  data <- x$get()
  v <- solve(data, ...)
  x$setsolve(v)
  v
}
