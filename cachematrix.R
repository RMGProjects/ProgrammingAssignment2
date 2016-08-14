## This pair of functions

## This function returns an object that has four functions, or
## methods available to it for working with invertible matrices. These allow the caller to set and get the matrix and well as get and set the inverse of that matrix. There is no restirction on what can be passed as the argument x. The tast did not require any input checking. The object has an attribute inverseX that is null until the matrix is solved using the cacheSolve function. 

makeCacheMatrix <- function(x = matrix()) {
	inverseX <- NULL
	set <- function(y){
		x <<- y
		inverseX <<- NULL
	}
	get <- function() x
	getInverse <- function() inverseX
	setInverse <- function(solve) inverseX <<- solve
	list(set = set, get = get, getInverse = getInverse, setInverse = setInverse)	
}


## This function is designed to accept the object returned by the makeCacheMatrix function. It accesses the inverseX of the object passed as argument, and returns it if it is not null. If it is null then the inverse matrix is calculated, returned and stored as the inverseX attribute of the formal argument. 

cacheSolve <- function(x, ...) {
	inverseX <- x$getInverse()
	if(!is.null(inverseX)){
		message("Accessing cache")
		return(inverseX)
	}
	message("Calculating and caching inverse")
	userX <- x$get()
	inverseX <- solve(userX)
	x$setInverse(inverseX)
	inverseX
}
