## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(original_matrix = matrix()) {

    #DLL20151019 matrix_inverse is the cached inverse matrix
    matrix_inverse <- NULL
    
    #DLL20151019 The setter function -- no inverse calculated upon initialization
    set <- function(y) {
        original_matrix <<- y
        matrix_inverse <<- NULL
    }
    
    #DLL20151019 Getter function -- return the matrix
    get <- function() {
        original_matrix
    }
    
    #DLL20151019 Save the inverse into the cache variable
    setinverse <- function(solve) {
        matrix_inverse <<- solve
    }

    #DLL20151019 Return the cache value.  It might be NULL.
    getinverse <- function() {
        matrix_inverse
    }
    
    #DLL2015 Return the operators defined.
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    
    #DLL20151019 First check if the inverse value is already cached.
    result <- x$getinverse()
    
    #DLL20151019 If it is available (thus, not null) return the cached value
    if(!is.null(result)) {
        message("getting cached data")
        return(result)
    }
    
    #DLL20151019 Code only reached if cached value unavailabble
    #Get the original matrix, solve for the inverse, set the cache value, and return the inverse
    data <- x$get()
    result <- solve(data)
    x$setinverse(result)
    result

}
