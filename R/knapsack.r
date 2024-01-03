knapSack <- function(W, wt, val, n) {
  K <- matrix(0, nrow = n + 1, ncol = W + 1)
  
  for (i in 1:(n + 1)) {
    for (w in 1:(W + 1)) {
      if (i == 1 || w == 1) {
        K[i, w] <- 0
      } else if (wt[i - 1] <= w) {
        K[i, w] <- max(val[i - 1] + K[i - 1, w - wt[i - 1]], K[i - 1, w])
      } else {
        K[i, w] <- K[i - 1, w]
      }
    }
  }
  
  return(K[n + 1, W + 1])
}

# Example usage
val <- c(60, 100, 120) # Values of items
wt <- c(10, 20, 30)    # Weights of items
W <- 50                # Capacity of knapsack
n <- length(val)       # Number of items

# Calculate the maximum value that can be put in a knapsack of capacity W
result <- knapSack(W, wt, val, n)
print(paste("Maximum value in knapsack =", result))
