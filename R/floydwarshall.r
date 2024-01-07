floyd_warshall <- function(graph) {
  n <- nrow(graph)
  dist <- graph

  for (k in 1:n) {
    for (i in 1:n) {
      for (j in 1:n) {
        dist[i, j] <- min(dist[i, j], dist[i, k] + dist[k, j])
      }
    }
  }
  return(dist)
}

# Example usage
graph <- matrix(c(0, 5, Inf, 10,
                  Inf, 0, 3, Inf,
                  Inf, Inf, 0, 1,
                  Inf, Inf, Inf, 0), 
                nrow = 4, byrow = TRUE)
print(floyd_warshall(graph))
