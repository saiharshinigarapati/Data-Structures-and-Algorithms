#include <iostream>
#include <vector>
using namespace std;

int shortestPath(vector<vector<int>> &graph) {
    int n = graph.size();
    vector<int> cost(n, INT_MAX);
    cost[0] = 0;

    for (int i = 1; i < n; i++) {
        for (int j = 0; j < i; j++) {
            if (graph[j][i] == 0) continue;
            cost[i] = min(cost[i], cost[j] + graph[j][i]);
        }
    }

    return cost[n - 1];
}

int main() {
    vector<vector<int>> graph = {{0, 1, 2, 5, 0, 0, 0},
                                 {0, 0, 0, 0, 4, 11, 0},
                                 {0, 0, 0, 0, 9, 5, 16},
                                 {0, 0, 0, 0, 0, 0, 2},
                                 {0, 0, 0, 0, 0, 0, 18},
                                 {0, 0, 0, 0, 0, 0, 13},
                                 {0, 0, 0, 0, 0, 0, 0}};
    cout << "Shortest path cost: " << shortestPath(graph) << endl;
    return 0;
}
