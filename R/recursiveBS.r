# Function for binary search
recursivebinarySearch <- function(vector, low, high, target) {
  if(low > high){
      return(-1)
  }

  mid <- floor((low + high) / 2)
  if(vector[mid] == target){
      return(mid)
  } else if (vector[mid] < target) {
      return(recursivebinarySearch(vector, mid + 1, high, target))
  } else {
      return(recursivebinarySearch(vector, low, mid - 1, target))
  }
}

# Read command line arguments
args <- commandArgs(trailingOnly = TRUE)

# Validate and parse arguments
if (length(args) >= 2) {
  vector <- as.integer(unlist(strsplit(args[1], ",")))
  target <- as.integer(args[2])

  # Perform binary search
  index <- recursivebinarySearch(vector, 1, length(vector), target)

  # Output the result
  if (index != -1) {
    cat("Target found at index:", index, "\n")
  } else {
    cat("Target not found in the vector.\n")
  }
} else {
  cat("Usage: Rscript binary_search.R \"1,3,5,7,9\" 5\n")
}
