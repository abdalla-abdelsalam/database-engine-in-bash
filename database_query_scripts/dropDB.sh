#!/bin/bash


source  utility_scripts/validation.sh


#function to drop  existed Databases
 function dropDB {
    read -p "Enter database name: "  db_name

    if ! check_valid_database_name "$db_name" ; then
        exit 1
    fi

    if [ ! -d "databases/$db_name" ]; then
        echo "Error: Database ${db_name} doesn't exsists."
        exit 1
    fi

    rm -rf "databases/${db_name}"

    if [[ $? -eq 0 ]] ;then
        echo "database ${db_name} deleted successfully. "
    else
        echo "couldn't delete ${db_name} database ."
        exit 1
    fi

 }

