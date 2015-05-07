unitTest <- function()
{
    # create two square matrices
    m1 <- round(10*matrix(rnorm(9),3,3))
    m2 <- round(10*matrix(rnorm(16),4,4))
    
    # Make sure they are both invertable
    i1 <- solve(m1)
    i2 <- solve(m2)
    
    # Display the matrices and their inverses
    print("Matrix A...")
    print(m1)
    print(i1)
    print("Matrix B...")
    print(m2)
    print(i1)
    
    # Test the code
    print("Creating cache for Matrix A...")
    f1 <- makeCacheMatrix(m1)
    print(f1)
    print("Creating cache for Matrix B...")
    f2 <- makeCacheMatrix(m2)
    print(f2)
    print("1st call of cacheSolve() for Matrix A...")
    c1_1st <- cacheSolve(f1)
    print(c1_1st)
    print("1st call of cacheSolve() for Matrix B...")
    c2_1st <- cacheSolve(f2)
    print(c2_1st)
    print("2nd call of cacheSolve() for Matrix A...")
    c1_2nd <- cacheSolve(f1)
    print(c1_2nd)
    print("2nd call of cacheSolve() for Matrix B...")
    c2_2nd <- cacheSolve(f2)
    print(c2_2nd)
}
