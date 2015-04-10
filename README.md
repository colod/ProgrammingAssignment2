### Caching the Inverse of a Matrix

Matrix inversion is usually a costly computation and there may be some
benefit to caching the inverse of a matrix rather than computing it
repeatedly. This repo contains two functions: 

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then
    `cacheSolve` should retrieve the inverse from the cache.

makeCacheMatrix creates a list of 4 functions based on the input matrix x.
The functions can then be called within the environment created by this
list.
It also initializes and stores variables for the matrix x and its inverse inv.

cacheSolve operates on the list made by makeCacheMatrix to first check if the
inverse has already been calculated, and if it has, to return it. If the 
inverse has not been calculated yet, it calculates it, stores it in the 
CacheMatrix, and returns it.