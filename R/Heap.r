MinHeap <- setRefClass("MinHeap",
    fields = list(heap = "numeric"),
    methods = list(
        insert = function(key) {
            heap <<- c(heap, key)
            self$heapifyUp(length(heap))
        },
        extractMin = function() {
            if (length(heap) == 0) {
                return(NA)
            }
            root <- heap[1]
            heap[1] <- heap[length(heap)]
            heap <<- heap[-length(heap)]
            self$heapifyDown(1)
            return(root)
        },
        heapifyUp = function(i) {
            while (i > 1 && heap[i] < heap[i %/% 2]) {
                temp <- heap[i]
                heap[i] <- heap[i %/% 2]
                heap[i %/% 2] <- temp
                i <- i %/% 2
            }
        },
        heapifyDown = function(i) {
            smallest <- i
            left <- 2 * i
            right <- 2 * i + 1
            if (left <= length(heap) && heap[left] < heap[smallest]) {
                smallest <- left
            }
            if (right <= length(heap) && heap[right] < heap[smallest]) {
                smallest <- right
            }
            if (smallest != i) {
                temp <- heap[i]
                heap[i] <- heap[smallest]
                heap[smallest] <- temp
                self$heapifyDown(smallest)
            }
        }
    )
)
MaxHeap <- setRefClass("MaxHeap",
    fields = list(heap = "numeric"),
    methods = list(
        insert = function(key) {
            heap <<- c(heap, key)
            self$heapifyUp(length(heap))
        },
        extractMax = function() {
            if (length(heap) == 0) {
                return(NA)
            }
            root <- heap[1]
            heap[1] <- heap[length(heap)]
            heap <<- heap[-length(heap)]
            self$heapifyDown(1)
            return(root)
        },
        heapifyUp = function(i) {
            while (i > 1 && heap[i] > heap[i %/% 2]) {
                temp <- heap[i]
                heap[i] <- heap[i %/% 2]
                heap[i %/% 2] <- temp
                i <- i %/% 2
            }
        },
        heapifyDown = function(i) {
            largest <- i
            left <- 2 * i
            right <- 2 * i + 1
            if (left <= length(heap) && heap[left] > heap[largest]) {
                largest <- left
            }
            if (right <= length(heap) && heap[right] > heap[largest]) {
                largest <- right
            }
            if (largest != i) {
                temp <- heap[i]
                heap[i] <- heap[largest]
                heap[largest] <- temp
                self$heapifyDown(largest)
            }
        }
    )
)
minH <- MinHeap$new()
minH$insert(3)
minH$insert(2)
minH$insert(15)
print(minH$extractMin()) # Should return 2

maxH <- MaxHeap$new()
maxH$insert(3)
maxH$insert(2)
maxH$insert(15)
print(maxH$extractMax()) # Should return 15
