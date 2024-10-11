#!/bin/bash

for i in {1..1000}
do
  java WSGenerator -i testRun.txt -s 15 -o testRun_result_$i.txt
  java WordSearchSolver testRun_result_$i.txt
  rm testRun_result_$i.txt  # This line deletes the file after processing
done
