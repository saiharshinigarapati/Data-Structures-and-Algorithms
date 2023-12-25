#include <iostream>
#include <vector>

class MinHeap {
private:
    std::vector<int> heap;

    int parent(int i) { return (i - 1) / 2; }
    int left(int i) { return (2 * i + 1); }
    int right(int i) { return (2 * i + 2); }

    void heapifyDown(int i) {
        int leftChild = left(i);
        int rightChild = right(i);
        int smallest = i;

        if (leftChild < heap.size() && heap[leftChild] < heap[i])
            smallest = leftChild;
        if (rightChild < heap.size() && heap[rightChild] < heap[smallest])
            smallest = rightChild;

        if (smallest != i) {
            std::swap(heap[i], heap[smallest]);
            heapifyDown(smallest);
        }
    }

    void heapifyUp(int i) {
        if (i && heap[parent(i)] > heap[i]) {
            std::swap(heap[i], heap[parent(i)]);
            heapifyUp(parent(i));
        }
    }

public:
    void insert(int key) {
        heap.push_back(key);
        int index = heap.size() - 1;
        heapifyUp(index);
    }

    int extractMin() {
        if (heap.size() == 0)
            return INT_MAX;

        int root = heap.front();
        heap[0] = heap.back();
        heap.pop_back();

        heapifyDown(0);
        return root;
    }

    void printHeap() {
        for (int i = 0; i < heap.size(); ++i)
            std::cout << heap[i] << " ";
        std::cout << "\n";
    }
};
