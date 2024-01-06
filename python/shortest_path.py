def shortestPath(graph, stages):
    n = len(graph)
    cost = [float('inf')] * n
    cost[0] = 0

    for i in range(1, n):
        for j in range(i):
            if graph[j][i] == 0:
                continue
            cost[i] = min(cost[i], cost[j] + graph[j][i])

    return cost[n - 1]

# Example graph
graph = [[0, 1, 2, 5, 0, 0, 0],
         [0, 0, 0, 0, 4, 11, 0],
         [0, 0, 0, 0, 9, 5, 16],
         [0, 0, 0, 0, 0, 0, 2],
         [0, 0, 0, 0, 0, 0, 18],
         [0, 0, 0, 0, 0, 0, 13],
         [0, 0, 0, 0, 0, 0, 0]]

print("Shortest path cost: ", shortestPath(graph, 4))
