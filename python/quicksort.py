# QuickSort in Python
def quicksort(arr):
    if len(arr) <= 1:
        return arr
    pivot = arr[len(arr) // 2]
    less = [x for x in arr if x < pivot]
    equal = [x for x in arr if x == pivot]
    greater = [x for x in arr if x > pivot]
    return quicksort(less) + equal + quicksort(greater)

# Example array
array = [3, 6, 8, 10, 1, 2, 1]

# Sort the array
sorted_array = quicksort(array)
sorted_array
