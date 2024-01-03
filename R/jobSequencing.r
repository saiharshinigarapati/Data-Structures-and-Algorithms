job_sequencing <- function(jobs, t) {
  jobs <- jobs[order(-jobs$profit),]
  result <- rep(NA, t)
  for (i in 1:nrow(jobs)) {
    for (j in min(t, jobs$deadline[i]):1) {
      if (is.na(result[j])) {
        result[j] <- jobs$id[i]
        break
      }
    }
  }
  return(result)
}

jobs <- data.frame(id = c('a', 'b', 'c', 'd', 'e'),
                   deadline = c(2, 1, 2, 1, 3),
                   profit = c(100, 19, 27, 25, 15))

print(job_sequencing(jobs, 3))
