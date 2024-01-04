primMST <- function(graph) {
  numVertices <- nrow(graph)
  parent <- integer(numVertices)
  key <- rep(Inf, numVertices)
  mstSet <- rep(FALSE, numVertices)
  key[1] <- 0
  parent[1] <- -1
  for (count in 1:(numVertices-1)) {
    u <- which.min(key)
    mstSet[u] <- TRUE
    for (v in 1:numVertices) {
      if (graph[u, v] != 0 && !mstSet[v] && graph[u, v] < key[v]) {
        parent[v] <- u
        key[v] <- graph[u, v]
      }
    }
  }
  return(list(parent = parent, key = key))
}

# Example usage
graph <- matrix(c(0, 2, 0, 6, 0,
                  2, 0, 3, 8, 5,
                  0, 3, 0, 0, 7,
                  6, 8, 0, 0, 9,
                  0, 5, 7, 9, 0), nrow = 5, byrow = TRUE)
result <- primMST(graph)
print(result)
