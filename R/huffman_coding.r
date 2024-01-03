library(heap)

# Create a Node structure
Node <- setRefClass("Node",
  fields = list(
    symbol = "character",
    freq = "numeric",
    left = "Node",
    right = "Node"
  ),
  methods = list(
    initialize = function(symbol, freq, left = NULL, right = NULL) {
      .self$symbol <- symbol
      .self$freq <- freq
      .self$left <- left
      .self$right <- right
    }
  )
)

# Function to build the Huffman Tree
buildHuffmanTree <- function(freq) {
  priority_queue <- Heap$new()
  
  for (name in names(freq)) {
    node <- Node$new(symbol = name, freq = freq[name])
    priority_queue$push(node, node$freq)
  }

  while (priority_queue$size() > 1) {
    left <- priority_queue$pop()
    right <- priority_queue$pop()
    merged <- Node$new(symbol = paste0(left$symbol, right$symbol),
                       freq = left$freq + right$freq, left = left, right = right)
    priority_queue$push(merged, merged$freq)
  }

  return(priority_queue$pop())
}

# Function to generate Huffman codes
generateCodes <- function(node, prefix = "") {
  if (is.null(node$left) && is.null(node$right)) {
    return(setNames(list(prefix), node$symbol))
  }
  else {
    return(c(generateCodes(node$left, paste0(prefix, "0")),
             generateCodes(node$right, paste0(prefix, "1"))))
  }
}

# Example usage
data <- "this is an example for huffman encoding"
freq <- table(strsplit(data, "")[[1]])

huffmanTree <- buildHuffmanTree(freq)
codes <- generateCodes(huffmanTree)

print(codes)
