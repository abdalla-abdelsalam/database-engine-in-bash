#!/bin/bash


# Function to check if the database name is valid
PS3="Please choose an option (enter the number): "
check_valid_name() {
    local db_name="$1"

    # Check if the database name is empty
    if [[ -z "$db_name" ]]; then
        echo "Error: input name cannot be empty."
        return 1
    fi

    # Check if the database name contains only valid characters (letters, digits, and hyphen)
    if [[ ! "$db_name" =~ ^[a-zA-Z0-9,_-]+$ ]]; then
        echo "Error: input name can only contain letters, digits, underscore (_) , hyphen (-) and comma (,) ."
        return 1
    fi


    # Check if the database name starts with a letter (lowercase or uppercase)
    if [[ ! "$db_name" =~ ^[a-zA-Z] ]]; then
        echo "Error: input name should start with a letter (lowercase or uppercase)."
        return 1
    fi

    # All checks passed, database name is valid
    return 0
}

