## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# This function takes a matrix, x, as an argument and returns a list of four functions: 
#1. A set function that can be used to change which matrix is stored in the variable x.
#2. A get function which displays the matrix stored in x.
#3. A setinverse function which takes the inverse of the matrix as an argument and stores that inverse in the variable i. 
#4. A getinverse function which displays the inverse matrix stored in i.

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

## Write a short comment describing this function

# This function takes a matrix object (i.e. a list created with makeCacheMatrix above) as an argument and then checks if that matrix object already has a stored inverse. If it does, then it displays the message "getting cached data" and displays the inverse. If it does now, then it displays the message "computing inverse", stores the inverse using the setinverse function, and finally displays that inverse.

cacheSolve <- function(my_matrix_object, ...) {
    i <- my_matrix_object$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- my_matrix$get()
    message("computing inverse")
    i <- solve(data, ...)
    my_matrix_object$setinverse(i)
    i
}

## Example of this working

# Create a new "CacheMatrix" object called "my_matrix".
my_matrix <- makeCacheMatrix(matrix(1:4,nrow=2))

# Attempt to get the inverse of this matrix. Notice that currently the inverse is null because the inverse hasn't been set yet.
my_matrix$getinverse()

# Use the cacheSolve function to set the inverse of the matrix. Notice that this prints the message "computing inverse" because the inverse actually has to be computed (previously it was NULL)
cacheSolve(my_matrix)

# Get the inverse of the matrix. Notice that the inverse is now set to the actual inverse of the matrix. This happened when cacheSolve was called above.
my_matrix$getinverse()

# Call cacheSolve again. Notice that this time, the message that prints is "getting cached data". The inverse is NOT recomputed. It is simpled pulled from the stored inverse.
cacheSolve(my_matrix)

# Change the matrix to a different matrix. This should clear the inverse.
my_matrix$set(matrix(2:5,nrow=2))

# Notice that it does in fact clear the inverse. It's back to being null.
my_matrix$getinverse()

# Call cache solve again. Notice that it once again has to actually compute the inverse (i.e. the "computing inverse" message is displayed.)
cacheSolve(my_matrix)

# Notice that now the inverse of this new matrix has been computed and stored.
my_matrix$getinverse()

# Call cache solve again on the new matrix. Notice that it does not re-compute the inverse. Instead it pulls it from the cahce (the "getting cached data" message is displayed.)
cacheSolve(my_matrix)
