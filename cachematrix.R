## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

    matrix_inverse <- NULL
    set <- function(y) {
        x <<- y
        matrix_inverse <<- NULL
    }
    
    get <- function() {
        x
    }
    
    setinverse <- function(solve) {
        matrix_inverse <<- solve
    }

    getinverse <- function() {
        matrix_inverse
    }
    
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    
    result <- x$getinverse()
    if(!is.null(result)) {
        message("getting cached data")
        return(result)
    }
    data <- x$get()
    result <- solve(data)
    x$setinverse(result)
    result

}
