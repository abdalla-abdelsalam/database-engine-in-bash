#!/bin/bash


source  utility_scripts/validation.sh


#function to drop  existed Databases
 function dropDB {

    if [[ -z $1 ]];then
        read -rp "Enter database name: "  db_name
    else
        db_name=$1
    fi

    if ! check_valid_name "$db_name" ; then
        return 1
    fi

    if [ ! -d "databases/$db_name" ]; then
        echo "Error: Database ${db_name} doesn't exsists."
        return 1
    fi

    rm -rf "databases/${db_name}"

    if [[ $? -eq 0 ]] ;then
        echo "database ${db_name} deleted successfully. "
    else
        echo "couldn't delete ${db_name} database ."
        return 1
    fi

 }

