matrix_chain_order <- function(p) {
  n <- length(p) - 1
  m <- matrix(0, n, n)
  for (L in 2:n) {
    for (i in 1:(n - L + 1)) {
      j <- i + L - 1
      m[i, j] <- Inf
      for (k in i:(j - 1)) {
        q <- m[i, k] + m[k + 1, j] + p[i] * p[k + 1] * p[j + 1]
        if (q < m[i, j])
          m[i, j] <- q
      }
    }
  }
  return(m[1, n])
}

arr <- c(1, 2, 3, 4)
cat("Minimum number of multiplications is", matrix_chain_order(arr), "\n")
