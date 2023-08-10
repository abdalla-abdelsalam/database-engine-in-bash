#!/bin/bash

source utility_scripts/validation.sh

#function to create Database
function createDB {

    read -p "Enter database name: "  db_name


   #condition to check database name validation
    if ! check_valid_name "$db_name" ; then
        exit 1
    fi

    #condition to check database directory if it is existed or not
    if [ -d "databases/$db_name" ]; then
    echo "Error: Database ${database_name} already exists."
    return 1
    fi

    #creating database
    mkdir "databases/$db_name"
    mkdir "databases/$db_name/table_definitions"
    mkdir "databases/$db_name/data_files"

    #condition to check if the database directory created or not
    if [[ $? -eq 0 ]] ;then
        echo "database ${db_name} created successfully. "
    else
        echo "couldn't create the database ."
        exit 1
    fi

 }

