# Database Management Systems

## Assignment 1
## Due date: Sep 15, 2021 
To  verify  the  effect  of  data  organization  on  I/O  time  we  want  to  have  a  practical  test.  To  avoid optimizations by the compiler we will use raw file I/O function fread/fwrite in C.

Create a text file on the hard disk of your computer. Your file should have 100,000 records. Each record 
should be of 1024 bytes. You may define the record format using a struct as: 

```c
struct MyRecord {
  int ID;
  char Name[1020]; 
}; 
```

Create a variable of type `MyRecord`, copy some string into the Name field. 

Now create a file in binary mode (wb) and write this record into it 100,000 times, put the loop variable in the ID field of the variable. We use binary mode to have the same length for records inside the file.

Close the file, and open it in read/write mode (r+b). 

#### Case 1:

Start timer, read all 100,000 blocks. What was the total time? 

#### Case 2:

Start timer, in a loop that repeats 100,000 times, generate random numbers, read the block. What was 
the total time? 

Hint: to read block n, you can use fseek function to go to the block then read it. Use (n-1)*1024 to find 
the offset of the block from the beginning of the file  Repeat Case 1 and Case 2. Do you get different timings? Why? 

#### Deliverable:

Write  a  report  about  your  experiments.  Put  your  code  in  the  report.  Discuss  your  results  and  findings.  

Save your report in pdf format, and submit it through BB. 