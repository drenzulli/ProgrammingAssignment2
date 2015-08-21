## This code provides a way to store a matrix and it's inverse
## so it's cached, and solve the cash to return the inverse

## Set and get a matrix and it's inverse

makeCacheMatrix <- function(original = matrix()) {
	inverse <- NULL

	set <- function(y) {
		original <<- y
		inverse <<- NULL
	}

	get <- function() original

	setInverse <- function(solve) inverse <<- solve
	getInverse <- function() inverse

	list(set = set, get = get, setInverse = setInverse,
		getInverse = getInverse)
}


## Return the cached matrix's inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$getInverse()

        if(!is.null(inverse)) {
        	message("getting cacheSolve data")
        	return(inverse)
        }

        data <- x$get()
        inverse <- solve(data)
        x$setInverse(inverse)
        inverse
}
