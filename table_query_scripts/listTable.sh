#!/bin/bash


function listTable {

local database_name=$1

schema_path=./databases/${database_name}/table_definitions/

if [[ -d ${schema_path} ]];then

 count='ls -l ${schema_path} | wc -l'
 
 if [[ -n $count ]];then
   ls ${schema_path}/ |awk -F"_" '{print $1}'
 else
  echo "No tables are found"
 fi

else
echo "table_definitions directory  doesn't exist"

fi
}

