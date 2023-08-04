#!/bin/bash

source table_query_scripts/create.sh
source table_query_scripts/insert.sh

function tableMenu { 
select var2 in "Create Table" "list Table" "Drop Table" "Insert into Table" " Select From Table" "Delete From Table" "Update Table" "Exit"
do

  if [[ $REPLY =~ ^[1-8]$ && -n $REPLY ]] ;then

      case $REPLY in

      1)
          #createTable
          echo "create table"
          create_schema "users"  "users" \
          "user_id" "integer" \
          "username" "text" \
          "email" "text" \
          "age" "integer"
          ;;


      2)
          #listTable
          ;;

      3)
          #dropTable
          ;;

      4)
          #insert
          insert_into_table "users" "users" 1 "John Doe" "john.doe@example.com" 30
          ;;
      
      5)
          #select
           ;;		  

      6)
          #delete
           ;;
 
      7)  
	   #update
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
