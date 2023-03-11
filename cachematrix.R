## Caching the Inverse of a Matrix	
	
	##This function creates a special "matrix" object that can cache its inverse.
	
	makeCacheMatrix <- function(x = matrix()) { ##assigning argument to "matrix"
	t <- NULL   ## t is set to NULL/value of inverse
	set <- function(y){     ##creating the set function something new
	x <<- y       ##value of matrix in parent environment
	t <<- NULL     ##if new matrix, set t to NULL
	}
	get <- function()x ##setting get function to return value of matrix
	setinverse <- function(inverse)t <<- inverse  ##t value in parent environment
	getinverse <- function()t
	list(set = set, get = get, setinverse = setinverse,
	getinverse = getinverse)        ##Using this for $ function
	}
	
	
	## This function computes the inverse of the special "matrix" returned by
	## MakeCacheMatrx above.
	
	cacheSolve <- function(x, ...) {
	t <- x$getinverse()
	if(!is.null(t)){          ##checking if inverse is Null or not
	message("getting cached data")
	return(t)              ##returns inverse
	}
	data <- x$get()
	t <- solve(data, ...)        ##computed inverse
	x$setinverse(t)      ## Return a matrix that is the inverse of 'x'
	t
	
