#!/bin/bash

declare -A column_positions
declare -A column_types
declare -A column_names
declare table_name

condition() {
  local database_name=$1

  read -p "Enter table name: " table_name

  # Check if the data file exists
  data_file="databases/${database_name}/data_files/${table_name}_data.txt"
  if [[ ! -f "$data_file" ]]; then
    echo "Data file for table '$table_name' does not exist."
    return 1
  fi

  # Read the condition from the user
  read -p "Enter column name, operator, and comparison value (e.g., 'age > 25'): " condition_input
  read -r column_name operator comparison_value <<< "$condition_input"

  schema_file="databases/${database_name}/table_definitions/${table_name}_schema.txt"

  let counter=1
  while IFS=: read -r col_name data_type; do
    column_positions["$col_name"]=${counter}
    column_types["$col_name"]=$data_type
    ((counter++))
  done < "$schema_file"
  # check if column name is empty
  if [[ -z "$column_name" ]]; then
      echo "column name can't be empty"
      return 1
  fi
  # Check if the specified column exists in the schema
  if [[ -z ${column_positions["$column_name"]} ]]; then
    echo "Column '$column_name' does not exist in the schema."
    return 1
  fi

  # Check the data types for the column
  if [ "${column_types["$column_name"]}" != "text" ]; then
    operator=$(echo "$operator" | sed 's/>=/-ge/g;s/<=/-le/g;s/>/-gt/g; s/==/-eq/g; s/!=/-ne/g; s/</-lt/g')
  fi
  
  
  # Read the data file, apply the condition, and display the filtered data
  let row_number=0
  numbers=()
  while read -r data_line; do
    ((row_number++))
    # Extract the value of the specified column from the data line
    column_value=$(echo "$data_line" | cut -d':' -f "${column_positions["$column_name"]}")

    # Check if the column value matches the condition using test command (or [ ])
    if [ $column_value  $operator $comparison_value 2>/dev/null  ]; then
      # Split the data line using colons as separators
      IFS=':' read -ra data_array <<< "$data_line"
      numbers+=(${row_number})
    fi    

  done < "$data_file"

}