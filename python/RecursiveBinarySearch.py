def RecursiveBinarySearch(low,high,key):
    if(low==high):
        if(array[low]==key):
            return low
        else:
            return -1
    else:
        mid=(low+high)//2
        if (key ==array[mid]):
            return mid
        elif (key > array[mid]):
            return RecursiveBinarySearch(mid+1,high,key)
        else:
            return RecursiveBinarySearch(low,mid-1,key)        



array=list(map(int,input().split()))
key=int(input())
s=RecursiveBinarySearch(0,len(array),key)
print(s)