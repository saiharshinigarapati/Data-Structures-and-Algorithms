#include <algorithm>
#include <iostream>
#include <vector>
using namespace std;

class DisjointSets {
public:
    vector<int> parent, rank;
    int n;

    DisjointSets(int n) {
        this->n = n;
        parent.resize(n);
        rank.resize(n);
        for (int i = 0; i < n; i++) parent[i] = i;
    }

    int find(int u) {
        if (u != parent[u]) parent[u] = find(parent[u]);
        return parent[u];
    }

    void merge(int x, int y) {
        x = find(x), y = find(y);
        if (rank[x] > rank[y]) parent[y] = x;
        else parent[x] = y;
        if (rank[x] == rank[y]) rank[y]++;
    }
};

struct Edge {
    int u, v, weight;
    bool operator<(Edge const& other) {
        return weight < other.weight;
    }
};

int main() {
    int V = 5, E = 7;
    vector<Edge> edges(E);

    // Example edges
    edges[0] = {0, 1, 1};
    edges[1] = {0, 2, 3};
    edges[2] = {1, 2, 3};
    edges[3] = {1, 3, 6};
    edges[4] = {1, 4, 4};
    edges[5] = {2, 3, 2};
    edges[6] = {3, 4, 5};

    sort(edges.begin(), edges.end());

    DisjointSets ds(V);
    vector<Edge> result;

    for (Edge e : edges) {
        if (ds.find(e.u) != ds.find(e.v)) {
            result.push_back(e);
            ds.merge(e.u, e.v);
        }
    }

    for (Edge e : result)
        cout << e.u << " -- " << e.v << " == " << e.weight << endl;

    return 0;
}
