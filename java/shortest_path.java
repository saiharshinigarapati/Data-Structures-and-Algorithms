import java.util.*;

public class shortest_path {
    public static int shortestPath(int[][] graph) {
        int n = graph.length;
        int[] cost = new int[n];
        Arrays.fill(cost, Integer.MAX_VALUE);
        cost[0] = 0;

        for (int i = 1; i < n; i++) {
            for (int j = 0; j < i; j++) {
                if (graph[j][i] == 0) continue;
                cost[i] = Math.min(cost[i], cost[j] + graph[j][i]);
            }
        }
        return cost[n - 1];
    }

    public static void main(String[] args) {
        int[][] graph = {{0, 1, 2, 5, 0, 0, 0},
                         {0, 0, 0, 0, 4, 11, 0},
                         {0, 0, 0, 0, 9, 5, 16},
                         {0, 0, 0, 0, 0, 0, 2},
                         {0, 0, 0, 0, 0, 0, 18},
                         {0, 0, 0, 0, 0, 0, 13},
                         {0, 0, 0, 0, 0, 0, 0}};
        System.out.println("Shortest path cost: " + shortestPath(graph));
    }
}
