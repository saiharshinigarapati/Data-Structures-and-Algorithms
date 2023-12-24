import java.util.Scanner;


public class recursiveBinarySearch {

    public static int recursiveBS(int[] array, int low, int high, int key) {
        if (low > high) {
            return -1;
        }

        int mid = low + (high - low) / 2;

        if (array[mid] == key) {
            return mid;
        } else if (array[mid] > key) {
            return recursiveBS(array, low, mid - 1, key);
        } else {
            return recursiveBS(array, mid + 1, high, key);
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the number of elements:");
        int n = sc.nextInt();
        int[] array = new int[n];
        System.out.println("Enter " + n + " sorted elements:");
        for (int i = 0; i < n; i++) {
            array[i] = sc.nextInt();
        }

        System.out.print("Enter the element to search for: ");
        int target = sc.nextInt();
        int result = recursiveBS(array, 0, n - 1, target);
        if (result == -1) {
            System.out.println("Element not present in the array.");
        } else {
            System.out.println("Element found at index: " + result);
        }
        sc.close();
    }
}
