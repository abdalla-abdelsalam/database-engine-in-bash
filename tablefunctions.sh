#!/bin/bash
 

function tableMenu { 
select var2 in "Create Table" "list Table" "Drop Table" "Insert into Table" " Select From Table" "Delete From Table" "Update Table" "Exit"
do

  if [[ $REPLY =~ ^[1-8]$ && -n $REPLY ]] ;then

      case $REPLY in

      1)
          #createTable
          echo "create table"
          ;;


      2)
          #listTable
          ;;

      3)
          #dropTable
          ;;

      4)
          #insert
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
           echo $PWD
           cd ../..  
           echo $PWD
           startupMenu 
           ;;

      esac
else
   echo "please enter valid number"
  fi
done

}
