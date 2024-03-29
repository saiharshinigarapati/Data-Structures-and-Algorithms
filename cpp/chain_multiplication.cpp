#include <iostream>
#include <vector>
using namespace std;

int MatrixChainOrder(vector<int>& p, int n) {
    vector< vector<int> > m(n, vector<int>(n, 0));

    for (int L = 2; L < n; L++) {
        for (int i = 1; i < n - L + 1; i++) {
            int j = i + L - 1;
            m[i][j] = INT_MAX;
            for (int k = i; k <= j - 1; k++) {
                int cost = m[i][k] + m[k + 1][j] + p[i - 1] * p[k] * p[j];
                if (cost < m[i][j])
                    m[i][j] = cost;
            }
        }
    }
    return m[1][n - 1];
}

int main() {
    vector<int> arr = {1, 2, 3, 4};
    int size = arr.size();
    cout << "Minimum number of multiplications is " << MatrixChainOrder(arr, size);
    return 0;
}
