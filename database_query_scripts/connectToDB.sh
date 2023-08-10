#!/bin/bash


source database_query_scripts/tablefunctions.sh



#function to connect to the  Database
function connectDB {

    flag="false"
    read -p "Enter database name: "  db_name
    for i in `ls ./databases`
    do
     if [[ $i == $db_name ]]; then
          flag="true"
      fi

     done

      if [[ $flag == "true" ]]; then
       tableMenu ${db_name}
      else
        echo "please enter correct database"
       fi


}

