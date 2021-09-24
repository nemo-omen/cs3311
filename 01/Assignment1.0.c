#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void case1();
void case2();

int main()
{
    //create file with 100,00 records of 1024 bytes each
    FILE *fp;
    fp = fopen("assignment1.txt", "wb");
    const void *ptr;
    fwrite(ptr, 1024, 100000, fp);
    //Create a format for the records
    struct MyRecord
    {
        int ID;
        char Name[1020];
    }record;
    //Fill in each member of MyRecord 100,000 times
    //then close the file

    if(fp == NULL)
    {
        printf("Error.");
    }
    else
    {
        printf("Writing file...\n");
        for(int e = 0; e < 100000; e++)
        {
            record = {e, "Random Name"};
        }
        printf("File writing complete.\nClosing file.\n");
    }
    fclose(fp);
    //Start timer, call case1(), stop timer, and then print time
    //elapsed to locate and read
    clock_t start, end;
    float cpu_time_used;

    printf("Starting timer for Case 1.\n");
    start = clock();
    case1();
    end = clock();
    printf("Timer stopped.\n");
    cpu_time_used = ((float) (end - start)) / CLOCKS_PER_SEC;

    printf("Case 1 : %f\n", cpu_time_used);
    //Start timer, call case2(), stop timer, and then print time
    //elapsed to locate and read
    printf("Starting timer for Case 2.\n");
    start = clock();
    case1();
    end = clock();
    printf("Timer stopped.\n");
    cpu_time_used = ((float) (end - start)) / CLOCKS_PER_SEC;

    printf("Case 1 : %f\n", cpu_time_used);

    return 0;
}

void case1()
{
    struct MyRecord record;

    FILE *fo;

    fo = fopen("assignment1.txt", "rb");

    if(fo == NULL)
    {
        printf("Error.\n");
        exit(1);
    }
    else
    {
       for(int e = 0; e < 100000; e++)
        {
            fread(&record, sizeof(struct MyRecord), 1, fo);
        }
        fclose(fo);
    }

}

void case2()
{
    struct MyRecord record;

    FILE *fo;

    fo = fopen("assignment1.txt", "rb");

    if(fo == NULL)
    {
        printf("Error.\n");
        exit(1);
    }
    else
    {
       for(int e = 0; e < 100000; e++)
        {
            int random = getRandom(1, 100000);

            fseek(fo, sizeof(struct MyRecord) * random, SEEK_SET);
            fread(&record, sizeof(struct MyRecord), 1, fo);
        }
        fclose(fo);
    }
}
