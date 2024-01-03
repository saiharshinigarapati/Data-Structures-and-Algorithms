def printJobScheduling(arr, t):
    # Step 1: Sort the jobs in descending order of profit
    n = len(arr)
    arr.sort(key=lambda x: x[2], reverse=True)

    # Step 2: Initialize result and slot availability
    result = [False] * t
    job = ['-1'] * t

    # Step 3: Iterate over sorted jobs
    for i in range(n):
        for j in range(min(t-1, arr[i][1]-1), -1, -1):
            if result[j] is False:
                result[j] = True
                job[j] = arr[i][0]
                break

    # Print the job sequence
    print(job)

# Example usage
arr = [['a', 2, 100],  # Job Array
       ['b', 1, 19],
       ['c', 2, 27],
       ['d', 1, 25],
       ['e', 3, 15]]
printJobScheduling(arr, 3)
