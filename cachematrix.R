## This set of functions allow to cache the invert matrix, so that it doesn't need
## to be calculated when it is needed for some original matrix. This allows to
## save computing resources

## This function creates a "matrix" that is able to store its inverse. It returns
## a list containing setter and getter function for the matrix itself and for the
## inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setSolve <- function(Solve) m <<- Solve
  getSolve <- function() m
  list(set = set, get = get, setSolve = setSolve, getSolve = getSolve)

}


## This function makes use of the result of the previous one. If the inverse already
## exists in the object x, it is returned, otherwise it is computed and stored in
## the object for future use.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getSolve()
  if (!is.null(m)) {
    message("getting cashed data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setSolve(m)
  m
}
