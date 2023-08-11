#!/bin/bash


source database_query_scripts/tablefunctions.sh



#function to connect to the  Database
function connectDB {

    read -rp "Enter database name: "  db_name

    if ! check_valid_name "$db_name" ; then
      return 1
    fi

    if [ ! -d "databases/$db_name" ]; then
        echo "Error: Database ${db_name} doesn't exsists."
        return 1
    fi

    tableMenu ${db_name}

}

