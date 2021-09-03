#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

struct MyRecord {
  int ID;

  char Name[1020];
};

void writeRecord();
void readAllData();
void readSingleRecord();
char* makeRandomName(int nameLength);

int main() {

  writeRecord();

  readAllData();

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
      printf("Record: {ID: %d, NAME: %s}\n", rec.ID, rec.Name);
    }

    fclose(fp);
  }
}