#include <fstream>
#include<iostream>
using namespace std;



int main() {

   long long int n=100;
   long long int value2[n][n], value1[n][n], mul[n][n];
   ifstream is("numbers.txt");

   for(int i=0; i<n; i++)
    {
        for(int j=0;j<n;j++){
            is >> value1[i][j];
        }

    }

    is.seekg (0, ios::beg);

    for(int i=0; i<n; i++)
    {
        for(int j=0;j<n;j++){
            is >> value2[i][j];
        }

    }

    cout << "Multiplied matrix:\n";
    for( int i=0; i<n; i++)
    {
        for(int j=0;j<n;j++){
            mul[i][j]=0;
            for(int k=0;k<n;k++){
                mul[i][j]+=value1[i][k]*value2[k][j];
            }
        }

    }

    for(int i=0; i<n; i++)
    {
        for(int j=0;j<n;j++){
            cout << mul[i][j] << " ";
        }
        cout << "\n";

    }



   is.close();
}
