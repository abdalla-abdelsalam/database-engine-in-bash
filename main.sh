#!/bin/bash

source  database_query_scripts/createDB.sh
source  database_query_scripts/listDB.sh
source  database_query_scripts/connectToDB.sh
source  database_query_scripts/dropDB.sh


function mainMenu {

  echo -e "\n+-----Main Menu-----------------+"
  echo "| 1. Create DB                  |"
  echo "| 2. list DB                    |"
  echo "| 3. connect DB                 |"
  echo "| 4. Drop DB                    |"
  echo "| 5. Exit                       |"
  echo "+-------------------------------+"

}



function startupMenu {

PS3="Database options : "

while true;
do 

 mainMenu
 read -rp "please enter option number : " option

  if [[ $option =~ ^[1-5]$ && -n $option ]] ;then

      case $option in 

      1) 
          createDB  
          ;;


      2)
          listDB
          ;;

      3)
          connectDB
          ;;

      4)
          dropDB
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
