#include<stdio.h>

int main()
{
    int i,j,k;
    int value1[1000][1000];
    int value2[1000][1000];
    int mul[1000][1000];
    FILE *file;
    file = fopen("numbers.txt","r");
    if (file == NULL)
        exit(1);
    i=0;
    for(i=0; i<1000; i++)
    {
        for(j=0;j<1000;j++){
            fscanf( file, "%d", &value1[i][j]);
        }

    }

    for(i=0; i<1000; i++)
    {
        for(j=0;j<1000;j++){
            fscanf( file, "%d", &value2[i][j]);
        }

    }

    printf("Multiplied matrix:\n");
    for(i=0; i<1000; i++)
    {
        for(j=0;j<1000;j++){
            mul[i][j]=0;
            for(k=0;k<1000;k++){
                mul[i][j]+=value1[i][k]*value2[k][j];
            }
        }

    }

    for(i=0; i<1000; i++)
    {
        for(j=0;j<1000;j++){
            printf("%d ",mul[i][j]);
        }
        printf("\n");

    }

    fclose(file);
    return 0;
}
