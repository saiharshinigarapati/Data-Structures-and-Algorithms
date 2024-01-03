# Here's a simple implementation of the 0/1 Knapsack problem using dynamic programming in Python:

def knapSack(W, wt, val, n):
    K = [[0 for x in range(W + 1)] for x in range(n + 1)]
    
    # Build table K[][] in a bottom-up manner
    for i in range(n + 1):
        for w in range(W + 1):
            if i == 0 or w == 0:
                K[i][w] = 0
            elif wt[i-1] <= w:
                K[i][w] = max(val[i-1] + K[i-1][w-wt[i-1]],  K[i-1][w])
            else:
                K[i][w] = K[i-1][w]
    
    return K[n][W]

# Example usage:
val = [60, 100, 120]   # The values of the items
wt = [10, 20, 30]      # The weight of the items
W = 50                 # The capacity of the knapsack
n = len(val)           # The number of items

# Calculate the maximum value that can be put in a knapsack of capacity W
result = knapSack(W, wt, val, n)
result
