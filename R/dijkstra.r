dijkstra <- function(graph, src) {
  n <- nrow(graph)
  dist <- rep(Inf, n)
  dist[src] <- 0
  sptSet <- rep(FALSE, n)

  for (count in 1:(n-1)) {
    u <- which.min(dist * (!sptSet))
    sptSet[u] <- TRUE

    for (v in 1:n) {
      if (!sptSet[v] && graph[u, v] != 0 && dist[u] != Inf && dist[u] + graph[u, v] < dist[v]) {
        dist[v] <- dist[u] + graph[u, v]
      }
    }
  }
  return(dist)
}

# Example usage
graph <- matrix(c(
  0, 1, 4, 0,
  1, 0, 2, 5,
  4, 2, 0, 1,
  0, 5, 1, 0
), nrow = 4, byrow = TRUE)

result <- dijkstra(graph, 1)
print(result)
