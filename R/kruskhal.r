library(igraph)

createGraph <- function(edges, n) {
  g <- graph.empty(n, directed = FALSE)
  for (e in edges) {
    g <- add_edges(g, c(e[1], e[2]))
    E(g)[length(E(g))]$weight <- e[3]
  }
  return(g)
}

kruskalMST <- function(g) {
  mst <- mst(g)
  return(mst)
}

edges <- matrix(c(
  1, 2, 10,
  1, 3, 6,
  1, 4, 5,
  2, 4, 15,
  3, 4, 4
), ncol = 3, byrow = TRUE)

num_vertices <- 4

g <- createGraph(edges, num_vertices)
mst <- kruskalMST(g)

plot(mst, edge.label = E(mst)$weight)
