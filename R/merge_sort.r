merge_sort <- function(arr) {
  if (length(arr) > 1) {
    mid <- length(arr) %/% 2
    L <- arr[1:mid]
    R <- arr[(mid+1):length(arr)]
    
    L <- merge_sort(L)
    R <- merge_sort(R)
    
    return(merge(L, R))
  } else {
    return(arr)
  }
}

merge <- function(L, R) {
  result <- c()
  while (length(L) > 0 && length(R) > 0) {
    if (L[1] <= R[1]) {
      result <- c(result, L[1])
      L <- L[-1]
    } else {
      result <- c(result, R[1])
      R <- R[-1]
    }
  }
  return(c(result, L, R))
}

# Example usage
arr <- c(12, 11, 13, 5, 6, 7)
sorted_arr <- merge_sort(arr)
print(sorted_arr)
