def BinarySearch(array,key):
    array=sorted(array)
    low=0
    high=len(array)
    while(low<=high):
        mid=(low+high)//2
        if (key==array[mid]):
            print("key is found at index",mid)
            return True
        elif (key>=array[mid]):
            low=mid+1
        else:
            high=mid-1
    return False
array=list(map(int,input().split()))
key=int(input())
s=BinarySearch(array,key)
print(s)       

        
