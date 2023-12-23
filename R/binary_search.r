# Function for binary search
binarySearch <- function(vector, target) {
  left <- 1
  right <- length(vector)

  while (left <= right) {
    mid <- floor((left + right) / 2)

    if (vector[mid] == target) {
      return(mid)
    } else if (vector[mid] < target) {
      left <- mid + 1
    } else {
      right <- mid - 1
    }
  }

  return(-1) # Target not found
}

# Read command line arguments
args <- commandArgs(trailingOnly = TRUE)

# Validate and parse arguments
if (length(args) >= 2) {
  vector <- as.integer(unlist(strsplit(args[1], ",")))
  target <- as.integer(args[2])

  # Perform binary search
  index <- binarySearch(vector, target)

  # Output the result
  if (index != -1) {
    cat("Target found at index:", index, "\n")
  } else {
    cat("Target not found in the vector.\n")
  }
} else {
  cat("Usage: Rscript binary_search.R \"1,3,5,7,9\" 5\n")
}
