#!/bin/bash

create_schema() {
  local database_name=$1
  read -rp "enter table name: " table_name

  if ! check_valid_name "$table_name" ; then
      return 1
  fi
  local schema_file="databases/${database_name}/table_definitions/${table_name}_schema.txt"

  # Check if the table already exists
  if [[ -f $schema_file ]]; then
    echo "Error: Table '$table_name' already exists."
    return 1
  fi

  touch ${schema_file}

  while true; do
    read -rp "Enter column name (or 'done' to finish): " column_name
    if ! check_valid_name "$column_name" ; then
        echo "try again "
        continue
    fi
    if [[ "$column_name" == "done" ]]; then
      break
    fi

    read -rp "Enter data type (e.g., integer, text, float): " data_type
    if ! check_valid_name "$data_type" ; then
        echo "try again "
        continue
    fi
    if [[ $data_type != "integer" && $data_type != "text" && $data_type != "float" ]];then
      echo "invalid data type ${data_type} "
      continue
    fi
    read -rp "Is '$column_name' the primary key? (y/n): " is_primary_key

    if ! check_valid_name "$is_primary_key" ; then
        continue
    fi
    if [[ $is_primary_key != "y" && $is_primary_key != "n" ]];then
      echo "Error: value of is primary key can be either y or n "
      continue
    fi

    if [[ "$is_primary_key" == "y" ]]; then
      if [[ -n "$primary_key_column" ]]; then
        echo "Only one primary key is allowed. you added column: ${primary_key_column} as primary key"
        is_primary_key='n'
      else
        primary_key_column="$column_name"
      fi
    fi

    echo "$column_name:$data_type:$is_primary_key" >> "$schema_file"
  done


  echo "Schema for '$table_name' created successfully in '$schema_file'."
}