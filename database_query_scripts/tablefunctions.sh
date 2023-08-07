#!/bin/bash

source table_query_scripts/create.sh
source table_query_scripts/insert.sh
source table_query_scripts/delete.sh
source table_query_scripts/listTable.sh
source table_query_scripts/drop.sh
source table_query_scripts/select.sh
source table_query_scripts/update.sh


function tableMenu { 
    local database_name=$1
select var2 in "Create Table" "list Table" "Drop Table" "Insert into Table" " Select From Table" "Delete From Table" "Update Table" "Exit"
do

  if [[ $REPLY =~ ^[1-8]$ && -n $REPLY ]] ;then

      case $REPLY in

      1)
          create_schema ${database_name} 
          ;;


      2)
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
