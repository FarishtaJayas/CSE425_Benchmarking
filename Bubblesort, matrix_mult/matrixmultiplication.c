#include<stdio.h>

int main()
{
    int i,j,k, n=5;
    int value1[n][n];
    int value2[n][n];
    int mul[n][n];
    FILE *file;
    file = fopen("number2.txt","r");

    for(i=0; i<n; i++)
    {
        for(j=0;j<n;j++){
            fscanf( file, "%d", &value1[i][j]);
        }

    }

    for(i=0; i<n; i++)
    {
        for(j=0;j<n;j++){
            fscanf( file, "%d", &value2[i][j]);
        }

    }

    printf("Multiplied matrix:\n");
    for(i=0; i<n; i++)
    {
        for(j=0;j<n;j++){
            mul[i][j]=0;
            for(k=0;k<n;k++){
                mul[i][j]+=value1[i][k]*value2[k][j];
            }
        }

    }

    for(i=0; i<n; i++)
    {
        for(j=0;j<n;j++){
            printf("%d ",mul[i][j]);
        }
        printf("\n");

    }

    fclose(file);
    return 0;
}
