#!/bin/bash

create_schema() {
  local database_name=$1
  shift
  local table_name=$1
  shift

  local schema_file="databases/${database_name}/table_definitions/${table_name}_schema.txt"

  # Check if the table already exists
  if [[ -f $schema_file ]]; then
    echo "Error: Table '$table_name' already exists."
    return 1
  fi



  while (( $# >= 2 )); do
    local column_name=$1
    local data_type=$2

    echo "$column_name:$data_type" >> "$schema_file"
    shift 2
  done

  echo "Schema for '$table_name' created successfully in '$schema_file'."
}

# Call the function to create schema for "users" table with columns and data types
create_schema "users"  "users" \
  "user_id" "integer" \
  "username" "text" \
  "email" "text" \
  "age" "integer"

# Call the function to create schema for "products" table with columns and data types
# create_schema "products" \
#   "product_id" "integer" \
#   "name" "text" \
#   "price" "float" \
#   "description" "text"