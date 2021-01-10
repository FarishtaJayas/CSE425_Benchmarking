class BubbleSort
{
    void bubbleSort(int arr[])
    {
        int n = arr.length;
        for (int i = 0; i < n-1; i++)
            for(int j = 0; j < n-i-1; j++)
                if (arr[j] > arr[j+1]))
                {
                    int temp = arr[j];
                    arr[j] = arr[j+1];
                    arr[j+1] = temp;
                }
    }

    void pintArray(int arr[])
    {
        int n = arr.length;
        for(int i = 0; i<n ; ++i)
            System.out.print(arr[i] + " ");
            System.out.println();

    }

    public Static Void main(String args[])
    {
        BubbleSort ob = new BubbleSort();
        int arr[] = {65, 34, 12, 14, 90};
        ob.bubbleSort(arr);
        System.out.println("Sorter Array: ");
        ob.printArray(arr);
    }
}