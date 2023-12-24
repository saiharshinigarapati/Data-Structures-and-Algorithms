#include <iostream>
#include <algorithm>
#include<vector>


int recursiveBS(const std::vector<int>& arr,int low,int high,int target){
 
 if(low == high){
    if(arr[low] ==target){
        return low;
    }
    else{
        return -1;
    }
 }
 else{
    int mid= (low+(high-low))/2;
    if(arr[mid] == target){
        return mid;
    }
    else if (arr[mid]>target){
        return recursiveBS(arr,mid+1,high,target);
    }
    else{
        return recursiveBS(arr,low,mid-1,target);
    }
 }

}


int main() {
    int n, target;
    std::cout << "Enter number of elements: ";
    std::cin >> n;

    std::vector<int> arr(n);
    std::cout << "Enter " << n << " elements in sorted order:\n";
    for (int i = 0; i < n; ++i) {
        std::cin >> arr[i];
    }

    std::cout << "Enter the element to search for: ";
    std::cin >> target;

    // Optionally sort the array if the input is not guaranteed to be sorted
    // std::sort(arr.begin(), arr.end());

    int result = recursiveBS(arr,0,n,target);

    if (result != -1) {
        std::cout << "Element found at index: " << result << std::endl;
    } else {
        std::cout << "Element not found in the array." << std::endl;
    }

    return 0;
}
