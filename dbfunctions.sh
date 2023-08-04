#!/bin/bash

source  tablefunctions.sh


# Function to check if the database name is valid
PS3="Please choose an option (enter the number): "
check_valid_database_name() {
    local db_name="$1"

    # Check if the database name is empty
    if [[ -z "$db_name" ]]; then
        echo "Error: Database name cannot be empty."
        return 1
    fi

    # Check if the database name contains only valid characters (letters, digits, and hyphen)
     if [[ ! "$db_name" =~ ^[a-zA-Z0-9_-]+$ ]]; then
        echo "Error: Database name can only contain letters, digits, underscore (_) and hyphen (-)."
        return 1
    fi

    # Check if the database name starts with a letter (lowercase or uppercase)
    if [[ ! "$db_name" =~ ^[a-zA-Z] ]]; then
        echo "Error: Database name should start with a letter (lowercase or uppercase)."
        return 1
    fi

    # All checks passed, database name is valid
    return 0
}

#function to create Database
function createDB {

    read -p "Enter database name: "  db_name


   #condition to check database name validation
    if ! check_valid_database_name "$db_name" ; then
        exit 1
    fi

    #condition to check database directory if it is existed or not
    if [ -d "./databases/$db_name" ]; then
    echo "Error: Database ${database_name} already exists."
    exit 1
    fi

    #creating database 
    mkdir "./databases/$db_name"

    #condition to check if the database directory created or not
    if [[ $? -eq 0 ]] ;then
        echo "database ${db_name} created successfully. "
    else
        echo "couldn't create the database ."
        exit 1
    fi

 }

#function to list existed Databases
function listDB {

  current_databases=`ls ./databases`

   #condtion to check if there ara databases or not
    if [[ -n $current_databases ]] ;then
        ls  "./databases"
    else
        echo "no databases found"
    fi

 }


#function to create Database
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
       cd ./databases/$db_name
       tableMenu
      else
        echo "please enter correct database"
       fi
   

}



#function to drop  existed Databases
 function dropDB {
    read -p "Enter database name: "  db_name

    if ! check_valid_database_name "$db_name" ; then
        exit 1
    fi

    if [ ! -d "./databases/$db_name" ]; then
        echo "Error: Database ${db_name} doesn't exsists."
        exit 1
    fi

    rm -rf "./databases/${db_name}"

    if [[ $? -eq 0 ]] ;then
        echo "database ${db_name} deleted successfully. "
    else
        echo "couldn't delete ${db_name} database ."
        exit 1
    fi

 }







