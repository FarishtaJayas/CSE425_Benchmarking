package org.bitan.bubble;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class bubbleJAVA {

    static void bubbleSort(int[] arr) {
        int n = arr.length;
        int temp = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 1; j < (n - i); j++) {
                if (arr[j - 1] > arr[j]) {
                    //swap elements
                    temp = arr[j - 1];
                    arr[j - 1] = arr[j];
                    arr[j] = temp;
                }

            }
        }
    }

    public static void main(String[] args) {
        int[] tall = new int[10];
        try {
            Scanner scanner = new Scanner(new File("C:\\Users\\BITAN\\Documents\\JAVASCRIPT\\New.txt"));

            int i = 0;
            while (scanner.hasNextInt()) {
                tall[i++] = scanner.nextInt();
            }
        } catch (FileNotFoundException filenotfoundexception) {
            System.out.println("File not found.");
        }
        bubbleSort(tall);
        for(int i=0;i<tall.length;i++)    //length is the property of the array
            System.out.println(tall[i]);
    }
}
