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
select var in "Create DB" "list DB"  "Connect DB"  "Drop DB" "Exit"
do    


if [[ ! $REPLY =~ "^\$" ]];then
  if [[ $REPLY =~ ^[1-5]$ && -n $REPLY ]] ;then

      case $REPLY in 

      1) 
          createDB  
          mainMenu
          ;;


      2)
          listDB
          mainMenu
          ;;

      3)
          connectDB
          mainMenu
          ;;

      4)
          dropDB
          mainMenu
          ;;
      5)
        exit
        ;;

      esac
  else
   echo "please enter valid number"
  fi
else
 echo "\ is not valid parameter"
fi

done 

}

startupMenu
