#!/bin/bash

source  database_query_scripts/createDB.sh
source  database_query_scripts/listDB.sh
source  database_query_scripts/connectToDB.sh
source  database_query_scripts/dropDB.sh


function Menu {

  echo -e "\n+-----Main Menu-----------------+"
  echo "| 1. Create DB                  |"
  echo "| 2. list DB                    |"
  echo "| 3. connect DB                 |"
  echo "| 4. Drop DB                    |"
  echo "| 5. Exit                       |"
  echo "+-------------------------------+"

}



function startupMenu {


select var in "Create DB" "list DB"  "Connect DB"  "Drop DB" "Exit"
do    

  if [[ $REPLY =~ ^[1-5]$ && -n $REPLY ]] ;then

      case $REPLY in 

      1) 
          createDB  
          Menu
          ;;


      2)
          listDB
          Menu
          ;;

      3)
          connectDB
          ;;

      4)
          dropDB
          Menu
          ;;
      5)
        exit
        ;;

      esac
else
   echo "please enter valid number"
  fi

done 

}

startupMenu
