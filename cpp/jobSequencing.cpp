#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

struct Job {
    char id;
    int deadline, profit;
};

bool comparison(Job a, Job b) {
    return (a.profit > b.profit);
}

void printJobScheduling(vector<Job> &arr, int t) {
    sort(arr.begin(), arr.end(), comparison);

    vector<bool> result(t, false);
    vector<char> job(t);

    for (int i = 0; i < arr.size(); i++) {
        for (int j = min(t - 1, arr[i].deadline - 1); j >= 0; j--) {
            if (!result[j]) {
                result[j] = true;
                job[j] = arr[i].id;
                break;
            }
        }
    }

    for (char jb : job) {
        if (jb) {
            cout << jb << " ";
        }
    }
}

int main() {
    vector<Job> arr = { {'a', 2, 100},
                        {'b', 1, 19},
                        {'c', 2, 27},
                        {'d', 1, 25},
                        {'e', 3, 15}};
    printJobScheduling(arr, 3);
    return 0;
}
