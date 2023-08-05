#!/bin/bash

create_schema() {
  local database_name=$1
  read -p "enter table name: " table_name

  local schema_file="databases/${database_name}/table_definitions/${table_name}_schema.txt"

  # Check if the table already exists
  if [[ -f $schema_file ]]; then
    echo "Error: Table '$table_name' already exists."
    return 1
  fi

  touch ${schema_file}

  while true; do
    read -p "Enter column name (or 'done' to finish): " column_name
    if [[ "$column_name" == "done" ]]; then
      break
    fi

    read -p "Enter data type (e.g., integer, text, float): " data_type

    echo "$column_name:$data_type" >> "$schema_file"
  done


  echo "Schema for '$table_name' created successfully in '$schema_file'."
}