class MinHeap:
    def __init__(self):
        self.Heap=[]
    def parent(self,i):
        return (i-1)//2
    def insertKey(self,k):
        self.Heap.append(k)
        i=len(self.Heap)-1
        while i!=0 and self.Heap[self.parent(i)]>self.heap[i]:
            self.heap[i],self.heap[self.parent(i)]=self.heap[self.parent(i)],self.heap[i]
            i=self.parent(i)


    def heapify(self,i):
        smallest =i 
        left=2*i+1
        right=2*i+2
        if left<len(self.heap) and self.heap[left]<self.heap[i]:
            smallest=left
        if right <len(self.heap) and self.heap[right]<self.heap[i]:
            smallest=right
        if smallest !=i:
            self.heap[i],self.heap[smallest]= self.heap[smallest],self.heap[i]
            self.heapify(smallest)


    def extractMin(self):
        if len(self.heap) ==0:
            return float("inf")
        if len(self.heap) ==1:
            return self.heap.pop()
        root=self.heap[0]
        self.heap[0]=self.heap.pop()
        self.heapify(0)
        return root


    def getMin(self):
        return self.heap[0] if self.heap else None


    def display(self):
        return self.Heap    




class MaxHeap:
    def __init__(self):
        self.heap = []

    def parent(self, i):
        return (i - 1) // 2

    def insertKey(self, k):
        self.heap.append(k)
        i = len(self.heap) - 1
        while i != 0 and self.heap[self.parent(i)] < self.heap[i]:
            self.heap[i], self.heap[self.parent(i)] = self.heap[self.parent(i)], self.heap[i]
            i = self.parent(i)

    def heapify(self, i):
        largest = i
        left = 2 * i + 1
        right = 2 * i + 2

        if left < len(self.heap) and self.heap[left] > self.heap[i]:
            largest = left
        if right < len(self.heap) and self.heap[right] > self.heap[largest]:
            largest = right

        if largest != i:
            self.heap[i], self.heap[largest] = self.heap[largest], self.heap[i]
            self.heapify(largest)

    def extractMax(self):
        if len(self.heap) == 0:
            return float("-inf")
        if len(self.heap) == 1:
            return self.heap.pop()
        root = self.heap[0]
        self.heap[0] = self.heap.pop()
        self.heapify(0)
        return root

    def getMax(self):
        return self.heap[0] if self.heap else None

    def display(self):
        return self.heap


def main():
    min_heap = MinHeap()
    max_heap = MaxHeap()

    while True:
        print("\nOptions:")
        print("1. Insert into Min Heap")
        print("2. Delete Min from Min Heap")
        print("3. Display Min Heap")
        print("4. Insert into Max Heap")
        print("5. Delete Max from Max Heap")
        print("6. Display Max Heap")
        print("7. Exit")

        choice = int(input("Enter your choice: "))

        if choice == 1:
            element = int(input("Enter the element to insert in Min Heap: "))
            min_heap.insertKey(element)
        elif choice == 2:
            print("Minimum Element Removed:", min_heap.extractMin())
        elif choice == 3:
            print("Min Heap:", min_heap.display())
        elif choice == 4:
            element = int(input("Enter the element to insert in Max Heap: "))
            max_heap.insertKey(element)
        elif choice == 5:
            print("Maximum Element Removed:", max_heap.extractMax())
        elif choice == 6:
            print("Max Heap:", max_heap.display())
        elif choice == 7:
            break
        else:
            print("Invalid choice. Please enter again.")

if __name__ == "__main__":
    main()
