# Define the matrices
x <- matrix(c(12, 34, 22, 10), nrow = 2, byrow = TRUE)
y <- matrix(c(3, 4, 2, 1), nrow = 2, byrow = TRUE)
z <- matrix(0, nrow = 2, ncol = 2)

# Print the first matrix
cat("The first matrix is:\n")
print(x)

# Print the second matrix
cat("The second matrix is:\n")
print(y)

# Strassen's algorithm calculations
m1 <- (x[1,1] + x[2,2]) * (y[1,1] + y[2,2])
m2 <- (x[2,1] + x[2,2]) * y[1,1]
m3 <- x[1,1] * (y[1,2] - y[2,2])
m4 <- x[2,2] * (y[2,1] - y[1,1])
m5 <- (x[1,1] + x[1,2]) * y[2,2]
m6 <- (x[2,1] - x[1,1]) * (y[1,1] + y[1,2])
m7 <- (x[1,2] - x[2,2]) * (y[2,1] + y[2,2])

z[1,1] <- m1 + m4 - m5 + m7
z[1,2] <- m3 + m5
z[2,1] <- m2 + m4
z[2,2] <- m1 - m2 + m3 + m6

# Print the product matrix
cat("Product achieved using Strassen's algorithm:\n")
print(z)
