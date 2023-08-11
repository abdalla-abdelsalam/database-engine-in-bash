#!/bin/bash

source table_query_scripts/create.sh
source table_query_scripts/insert.sh
source table_query_scripts/delete.sh
source table_query_scripts/listTable.sh
source table_query_scripts/drop.sh
source table_query_scripts/select.sh
source table_query_scripts/update.sh


function tabMenu {

  echo -e "\n+-----Table Menu----------------+"
  echo "| 1. Create Table               |"
  echo "| 2. list  Table                |"
  echo "| 3. Drop Table                 |"
  echo "| 4. Insert into Table          |"
  echo "| 5. Select From Table          |"
  echo "| 6. Delete From Table          |"
  echo "| 7. Update Table               |"
  echo "| 8. Return to main menu        |"
  echo "+-------------------------------+"

}


function tableMenu { 
    local database_name=$1

while true
do
 
 tabMenu
  read -rp "please enter table option  : " Table_option

  if [[ ${Table_option} =~ ^[1-8]$ && -n ${Table_option} ]] ;then

      case "${Table_option}" in

      1)
          create_schema ${database_name} 
          ;;


      '2')
          listTable  ${database_name} 
          ;;

      3)
          dropTable ${database_name}
          ;;

      4)
          insert_into_table ${database_name}
          ;;
      
      5)
         select_data_from_table ${database_name}
         ;;		  

      6)
          deleteTable ${database_name}
          ;;
 
      7)  
	  updateTable ${database_name}
          ;;

      8)   
           startupMenu 
           ;;

      esac
else
   echo "please enter valid number"
  fi
done

}
