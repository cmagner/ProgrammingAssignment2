#==============================================================================
# DESCRIPTION: 
# Matrix inversion is usually a costly computation and there may be
# some benefit to caching the inverse of a matrix rather than compute it 
# repeatedly (there are also alternatives to matrix inversion that we will not 
# discuss here).
# 
# This file contains a pair of functions that cache the inverse of a matrix.
#==============================================================================


#------------------------------------------------------------------------------
makeCacheMatrix <- function(x = matrix()) {
    # This function creates a special "matrix" object that can cache its 
    # inverse.
    
    # Add "inverse" to this environment
    inverse <- NULL
    
    set <- function(xx) {
        # This function can be used to change the cache matrix (after 
        # calling makeCacheMatrix() to create it)
        x <<- xx
        inverse <<- NULL
    }
    
    get <- function() {
        # This function returns the cache matrix
        x
    }
    
    setInverse <- function(inv) {
        # This function sets "inverse" in the parent environment
        inverse <<- inv
    }
    
    getInverse <- function() {
        # This function returns the cached matrix inverse
        inverse
    }
    
    # Return a list of functions that can set/get the matrix and its inverse
    list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)    
}


#------------------------------------------------------------------------------
cacheSolve <- function(x, ...) {
    # This function computes the inverse of the special "matrix" input to the 
    # makeCacheMatrix() function above. If the inverse has already been
    # calculated (and the matrix has not changed), this function will retrieve
    # the inverse from the cache.
    # 
    # Computing the inverse of a square matrix can be done with the solve
    # function in R. For example, if X is a square invertible matrix, then
    # solve(X) returns its inverse.
    # 
    # This code assumes that the matrix supplied is always invertible.
    
    # Get and return the cached matrix inverse (if it exists)
    inverse <- x$getInverse()
    if (!is.null(inverse)) {
        message("using cached data")
        return(inverse)
    }
    
    # Otherwise, compute the inverse of the captured matrix
    mtrx <- x$get()
    inverse <- solve(mtrx)
    
    # Save and return the newly cached matrix inverse
    x$setInverse(inverse)
    inverse
}
