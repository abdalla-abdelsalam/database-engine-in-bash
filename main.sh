#!/bin/bash


source  dbfunctions.sh

select var in "Create DB" "list DB"  "Connect DB"  "Drop DB" "Exit"
do 

  if [[ $REPLY =~ ^[1-5]$ && -n $REPLY ]] ;then

      case $REPLY in 

      1) 
          createDB  
          ;;


      2)
          listDB
          ;;

      3)
          #connectDB
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