#!/bin/bash




function deleteTable (){

 local table_name
 
 read -p "Enter tablename "  table_name
 
 if [[ -f ${table_name}* ]];then 
 
  select var in "all" "record" "Exit"
  do
     if [[ $REPLY =~ ^[1-3]$ && -n $REPLY ]] ;then
       case $REPLY in

         1)
            rm -r ./${table_name}_data.txt

            if [[ $? -eq 0 ]];then
             echo "all table data has been deleted successfully"
            else
              echo "there is an error to delete the table data"
            fi
             ;;

          2)
            read -p "Enter the key :" key

            sed -i '/$key/d'  ./${table_name}_data.txt
            if [[ $? -eq 0 ]];then
             echo "record has been deleted successfully" 
            else
              echo "there is an error to delete record"          
            fi 
              ;;
     
         3)
             exit
             ;;

      esac
    else
       echo "please enter valid number"
    fi

   done
  
  else
     echo "the table doesn't exist"
  fi

}

