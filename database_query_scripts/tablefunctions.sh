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
select var2 in 'Create Table' 'list Table' 'Drop Table' 'Insert into Table' ' Select From Table' 'Delete From Table' 'Update Table' 'Exit'
do

  if [[ $REPLY =~ ^[1-8]$ && -n $REPLY ]] ;then

      case "$REPLY" in

      1)
          create_schema ${database_name} 
          tabMenu
          ;;


      '2')
          listTable  ${database_name} 
          tabMenu 
          ;;

      3)
          dropTable ${database_name}
          tabMenu 
          ;;

      4)
          insert_into_table ${database_name}
          tabMenu
          ;;
      
      5)
         select_data_from_table ${database_name}
         tabMenu   
         ;;		  

      6)
          deleteTable ${database_name}
          tabMenu  
          ;;
 
      7)  
	  updateTable ${database_name}
          tabMenu
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
