#!/bin/bash


function listTable {
count='ls -l . | wc -l'
 
 if [[ -n $count ]];then
   ls *_schema.txt |awk -F"_" '{print $1}'
 else
  echo "No tables are found"
 fi
}

