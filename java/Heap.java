import HeapPackage.MaxHeap;
import HeapPackage.MinHeap;

public class Heap {
    public static void main(String[] args) {
        // Create a MinHeap and MaxHeap
        int maxHeapSize = 10;
        MinHeap minHeap = new MinHeap(maxHeapSize);
        MaxHeap maxHeap = new MaxHeap(maxHeapSize);

        // Insert elements into MinHeap
        System.out.println("Inserting elements into MinHeap:");
        int[] elementsToInsert = {3, 2, 15, 5, 4, 45};
        for (int i : elementsToInsert) {
            minHeap.insert(i);
            System.out.println("Inserted " + i + " in MinHeap");
        }

        // Removing elements from MinHeap
        System.out.println("\nRemoving elements from MinHeap:");
        while (minHeap.getSize() > 0) {
            int min = minHeap.remove();
            System.out.println("Removed " + min + " from MinHeap");
        }

        // Insert elements into MaxHeap
        System.out.println("\nInserting elements into MaxHeap:");
        for (int i : elementsToInsert) {
            maxHeap.insert(i);
            System.out.println("Inserted " + i + " in MaxHeap");
        }

        // Removing elements from MaxHeap
        System.out.println("\nRemoving elements from MaxHeap:");
        while (maxHeap.getSize() > 0) {
            int max = maxHeap.remove();
            System.out.println("Removed " + max + " from MaxHeap");
        }
    }
}


