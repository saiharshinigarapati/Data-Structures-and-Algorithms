quicksort <- function(arr) {
  if (length(arr) <= 1) {
    return(arr)
  } else {
    pivot <- arr[floor(length(arr) / 2)]
    left <- arr[arr < pivot]
    middle <- arr[arr == pivot]
    right <- arr[arr > pivot]
    return(c(quicksort(left), middle, quicksort(right)))
  }
}

# Example usage:
example_array <- c(3, 6, 8, 10, 1, 2, 1)
sorted_array <- quicksort(example_array)
print(sorted_array)
