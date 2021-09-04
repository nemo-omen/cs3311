#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

struct MyRecord {
  int ID;

  char Name[1020];
};

struct ReportData {
  double read;
  double random;
  double difference;
  char* longer;
};

void writeRecord();
void readAllData();
void readDataWithRandom();
void generateReadWriteReports(int iterations);
int getRandom(int min, int max);
void printReport(int iterations, struct ReportData records[]);


int main() {

  generateReadWriteReports(50);

  return 0;
}

void writeRecord() {
  FILE *fp;

  fp = fopen("data.bin", "wb");

  struct MyRecord rec;

  if(fp == NULL) {
    printf("Error opening data.bin\n");

    exit(1);
  } else {

    for(int i = 1; i <= 100000; i++) {
        rec.ID = i;
        strcpy(rec.Name,  "ABCDE");

        fwrite(&rec, sizeof(struct MyRecord), 1, fp);
    }
  }

  fclose(fp);
}

void readAllData() {
  FILE *fp;
  struct MyRecord rec;

  fp = fopen("data.bin", "rb");

  if(fp == NULL) {
    printf("Error opening data.bin\n");

    exit(1);
  } else {
    for(int i = 1; i <= 100000; i++) {
      fread(&rec, sizeof(struct MyRecord), 1, fp);
    }

    fclose(fp);
  }
}

void readDataWithRandom() {
  FILE *fp;

  struct MyRecord rec;

  fp = fopen("data.bin", "rb");

  if(fp == NULL) {
    printf("Error opening data.bin.");

    exit(1);
  } else {
    for(int i = 0; i < 100000; i++) {
      int rando = getRandom(1, 1000);

      fread(&rec, sizeof(struct MyRecord), 1, fp);
    }
  }

  fclose(fp);
}

void generateReadWriteReports(int iterations) {

  struct ReportData allReports[iterations];

  for(int i = 0; i < iterations; i ++) {
    clock_t 
      w_start, 
      w_end, 
      r_start, 
      r_end;

    double w_time, r_time;

    struct ReportData report;

    writeRecord();

    w_start = clock();
    readAllData();
    w_end = clock();
    w_time = ((double) w_end - w_start) / CLOCKS_PER_SEC;
    report.read = w_time;

    r_start = clock();
    readDataWithRandom();
    r_end = clock();
    r_time = ((double) r_end - r_start) / CLOCKS_PER_SEC;
    report.random = r_time;

    if(r_time > w_time) {
      report.difference = r_time - w_time;
      report.longer = "Random";
    } else {
      report.difference = w_time - r_time;
      report.longer = "Nonrandom";
    }

    allReports[i] = report;
  }

  printReport(iterations, allReports);
}

void printReport(int iterations, struct ReportData records[]) {
  double 
    totalRead,
    averageRead,
    totalRandom, 
    averageRandom,
    totalDifference, 
    averageDifference;
  
  printf("-----------------------------------------------------------------------\n");
  printf("Iteration\tRead Time\tRandom Time\tDifference\tLonger\n");
  printf("-----------------------------------------------------------------------\n");
  for(int i = 0; i < iterations; i ++) {
    totalRead = totalRead + records[i].read;
    totalRandom = totalRandom + records[i].random;
    totalDifference = totalDifference + records[i].difference;

    printf(
      "%d\t\t%fs\t%fs\t%fs\t%s\n",
      i +1,
      records[i].read,
      records[i].random,
      records[i].difference,
      records[i].longer
      );
  }
  printf("-----------------------------------------------------------------------\n");

  averageRead = totalRead / iterations;
  averageRandom = totalRandom / iterations;
  averageDifference = totalDifference / iterations;

  printf("Average:\t%fs\t%fs\t%fs\n", averageRead, averageRandom, averageDifference);
  printf("-----------------------------------------------------------------------\n");
}

int getRandom(int min, int max) {
  return (rand() % (max - min + 1) + min);
}