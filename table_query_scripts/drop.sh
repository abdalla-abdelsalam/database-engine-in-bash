#!/bin/bash


function dropTable {

local database_name=$1

local table_name

read  -rp "please enter table name : " table_name
if ! check_valid_name "$table_name" ; then
    return 1
fi

 data_path=./databases/${database_name}/data_files/${table_name}_data.txt
 schema_path=./databases/${database_name}/table_definitions/${table_name}_schema.txt

  if [[  -f ${schema_path}  ]]; then 
    
     rm  ${schema_path}
     echo "schema has been deleted successfully" 
  else
        echo "there is no schema to delete schema"          
   fi  
 

   if [[ -f ${data_path} ]];then
  
     rm ${data_path} 
     echo "data table has been deleted successfully"
   else
        echo "there is no data table to delete "
    fi

} 
