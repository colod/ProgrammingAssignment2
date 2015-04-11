## makeCacheMatrix creates a list of 4 functions based on the input matrix x.
## These functions can then be called within the environment created by this
## list. 
## CacheSolve operates on a CacheMatrix of a particular matrix. It returns the 
## inverse from the CacheMatrix if it has been calculated already, and calculates
## and stores it in the CacheMatrix if it has not been calculated already.

## makeCacheMatrix creates functions based on the input matrix x.
## set stores the value of the matrix locally.
## get returns the locally stored value.
## setinverse stores the inverse of the matrix locally.
## getinverse returns the locally stored value of the inverse.

makeCacheMatrix <- function(x = matrix()) {
        xinv<-NULL
        set <- function(y){
                x <<- y ## Stores the value of the matrix in the local environment.
                xinv <<- NULL ## Indicates that the inverse has not been calculated.
                ## This is necessary so that if the value of the matrix is changed,
                ## it erases the old value of the inverse.
        }
        get <- function() {x} ## Returns the locally stored value of the matrix.
        setinverse <- function(inverse) {xinv <<- inverse} ## Stores the input in 
        ## the local environment variable for the inverse.
        getinverse <- function () {xinv} ## Returns the locally stored value of the
        ## inverse.
                list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## CacheSolve operates on a CacheMatrix of a particular matrix. It returns the 
## inverse from the CacheMatrix if it has been calculated already, and calculates
## and stores it in the CacheMatrix if it has not been calculated already.

cacheSolve <- function(x, ...) {
        xinv <- x$getinverse() ## pulls value of "xinv" from the CacheMatrix.
        if(!is.null(xinv)) { ## Checks if the inverse has been calculated.
                message("getting cached data") ##Returns a message to console.
                return(xinv) ## Returns the pre-calculated inverse.
        }
        data <- x$get()  ##Pulls the matrix value from the CacheMatrix.
        xinv <- solve(data, ...) ##Calculates the inverse of the pulled matrix.
        x$setinverse(xinv) ##Stores the inverse value in the CacheMatrix.
        xinv ## Return a matrix that is the inverse of 'x'.
}
