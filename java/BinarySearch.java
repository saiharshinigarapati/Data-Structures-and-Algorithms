import java.util.Scanner;
public class BinarySearch {

    public static int binarysearch(int[] array,int key){

        int low=0;
        int high=array.length-1;
        int mid;
        while(low<=high){
            mid=(low+(high-low))/2;
            if(array[mid]==key){
                return mid;
            }
            if(array[mid]>array[low]){
                   low=mid+1;
            }   
            else{
                high=mid-1;
            }
        }
        return -1;
    }

public static void main(String[] args){
  Scanner sc = new Scanner(System.in);
  System.out.println("enter number of elements");
  int n =sc.nextInt();
  int[] arr=new int[n];

  System.out.println("enter"+n+"sorted elements");
  for(int i=0;i<n;i++){
      arr[i]=sc.nextInt();
  }

  System.out.print("enter the element to search for:");
  int target=sc.nextInt();
  int result= binarysearch(arr,target);
  if(result ==-1){
      System.out.println("element not present in the array ");
  }
  else{
      System.out.println("element found at index:"+result);
  }
  sc.close();
}
}

