shortestPath <- function(graph) {
  n <- nrow(graph)
  cost <- rep(Inf, n)
  cost[1] <- 0

  for (i in 2:n) {
    for (j in 1:(i-1)) {
      if (graph[j, i] != 0) {
        cost[i] <- min(cost[i], cost[j] + graph[j, i])
      }
    }
  }

  return(cost[n])
}

# Example graph
graph <- matrix(c(0, 1, 2, 5, 0, 0, 0,
                  0, 0, 0, 0, 4, 11, 0,
                  0, 0, 0, 0, 9, 5, 16,
                  0, 0, 0, 0, 0, 0, 2,
                  0, 0, 0, 0, 0, 0, 18,
                  0, 0, 0, 0, 0, 0, 13,
                  0, 0, 0, 0, 0, 0, 0), nrow = 7, byrow = TRUE)

print(paste("Shortest path cost:", shortestPath(graph)))
