#!/bin/bash


function dropTable {

local table_name

read  -p "please enter table name : " table_name

  if [[ -f ${table_name}_schema.txt || -f ${table_name}_data.txt  ]]; then 
    
     rm ${table_name}_*
     
    if [[ $? -eq 0 ]];then
        echo "table has been deleted successfully" 
    else
        echo "there is an error to delete table"          
      fi  

  else
    echo "table doesn't exist"

  fi


} 
