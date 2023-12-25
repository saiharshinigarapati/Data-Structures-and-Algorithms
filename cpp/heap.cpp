#include <iostream>
#include "max_heap.h"
#include "min_heap.h"

int main() {
    MinHeap minHeap;
    MaxHeap maxHeap;

    // Insert elements into MinHeap
    minHeap.insert(3);
    minHeap.insert(2);
    minHeap.insert(15);

    // Insert elements into MaxHeap
    maxHeap.insert(3);
    maxHeap.insert(2);
    maxHeap.insert(15);

    // Print MinHeap and MaxHeap
    std::cout << "Min Heap: ";
    minHeap.printHeap();

    std::cout << "Max Heap: ";
    maxHeap.printHeap();

    // Extract from MinHeap and MaxHeap
    std::cout << "Min Heap Extracted: " << minHeap.extractMin() << std::endl;
    std::cout << "Max Heap Extracted: " << maxHeap.extractMax() << std::endl;

    return 0;
}
