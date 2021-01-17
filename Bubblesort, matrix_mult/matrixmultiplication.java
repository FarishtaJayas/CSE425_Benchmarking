
package BubbleSort;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
	int n = 5, i, j, k;
        int[][] matrix1 = new int[n][n];
	int[][] matrix2 = new int[n][n];
	int[][] result = new int[n][n];
	
        try {
            Scanner scanner = new Scanner(new File("E:\\Codes\\cse425_benchmarking\\Bubblesort, matrix_mult\\number2.txt"));

            
            while (scanner.hasNextInt()) {
		for(i=0; i<n; i++){
			for(j=0; j<n; j++){
                		matrix1[i][j] = scanner.nextInt();
			}
		}
            }
        } catch (FileNotFoundException filenotfoundexception) {
            System.out.println("File not found.");
        }

	try {
            Scanner scanner = new Scanner(new File("E:\\Codes\\cse425_benchmarking\\Bubblesort, matrix_mult\\number2.txt"));

            
            while (scanner.hasNextInt()) {
		for(i=0; i<n; i++){
			for(j=0; j<n; j++){
                		matrix2[i][j] = scanner.nextInt();
			}
		}
            }
        } catch (FileNotFoundException filenotfoundexception) {
            System.out.println("File not found.");
        }


        for(i=0; i<n; i++){
			for(j=0; j<n; j++){
                		for(k=0;k<n;k++){
                			result[i][j]+=matrix1[i][k]*matrix2[k][j];
            			}
			}
		}
            }
        for(i=0; i<n; i++){
		for(j=0; j<n; j++) {    
            		System.out.println(result[i][j);
		}
		System.out.println();
	}
    }
}
