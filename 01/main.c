#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

struct MyRecord {
  int ID;

  char Name[1020];
};

struct ReportData {
  long read;
  long readrandom;
};

void writeRecord();
void readAllData();
void readDataWithRandom();
void generateReadWriteReports(int iterations);
int getRandom(int min, int max);
void printReport(int iterations, struct ReportData records[]);


int main() {

  generateReadWriteReports(10);

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
      // printf("Record: {ID: %d, NAME: %s}\n", rec.ID, rec.Name);
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
      int rando = getRandom(1, 100);

      fread(&rec, sizeof(struct MyRecord), 1, fp);
      // printf("Record: {ID: %d, NAME: %s}\n", rec.ID, rec.Name);
    }
  }

  fclose(fp);
}

void generateReadWriteReports(int iterations) {

  struct ReportData allReports[iterations];

  for(int i = 0; i < iterations; i ++) {
    clock_t w, r;
    struct ReportData report;

    writeRecord();

    w = clock();
    readAllData();
    w = clock() - w;
    report.read = w;

    r = clock();
    readDataWithRandom();
    r = clock() - r;
    report.readrandom = r;

    // printf("readAllData() completed in %lums\n", w);
    // printf("readDataWithRandom() completed in %lums\n", r);

    allReports[i] = report;
  }

  // for(int r = 0; r < iterations; r++) {
  //   printf("Iteration: %d\nNormal Read: %lu\nRead w/ Random: %lu\n", r + 1, allReports[r].read, allReports[r].readrandom);
  // }
  printReport(iterations, allReports);
}

void printReport(int iterations, struct ReportData records[]) {
  printf("Iteration\tRead Only Time\tRead w/Random Time\n");
  printf("--------------------------------------------------\n");
  for(int i = 0; i < iterations; i ++) {
    printf("%d\t\t   %lums   \t\t%lums\n", i + 1, records[i].read, records[i].readrandom);
  }
  printf("\n");
}

int getRandom(int min, int max) {
  return (rand() % (max - min + 1) + min);
}