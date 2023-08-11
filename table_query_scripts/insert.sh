#!/bin/bash
check_for_duplicates() {
  local database_name=$1
  local table_name=$2
  local primary_key_column_num=$3
  local entered_value=$4
  local data_file="databases/${database_name}/data_files/${table_name}_data.txt"

  output_column=$(cut -d ":" -f ${primary_key_column_num} "$data_file")
  while read -r record_value; do
    # check if record_value is empty
    if [ -z ${record_value} ]; then
      break
    fi
    # Loop through each value in the third column
    if [ ${record_value} = ${entered_value} ]; then
      return 1
    fi
    # Add your code here to process each value in the third column
  done <<< $output_column
  return 0
}

validate_data_type() {
  local column_name=$1
  local data_type=$2
  local value=$3

  case $data_type in
    integer)
      if ! [[ $value =~ ^[0-9]+$ ]]; then
        echo "Error: Value for column '$column_name' must be an integer."
        return 1
      fi
      ;;
    float)
      if ! [[ $value =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]]; then
        echo "Error: Value for column '$column_name' must be a float."
        return 1
      fi
      ;;
    text)
      # No specific validation for text data type
      ;;
    *)
      echo "Error: Unknown data type '$data_type' for column '$column_name'."
      return 1
      ;;
  esac
}

insert_into_table() {
  local database_name=$1
  read -rp "enter table name: " table_name
  if ! check_valid_name "$table_name" ; then
      return 1
  fi
  # Check if the table schema exists
  local schema_file="databases/${database_name}/table_definitions/${table_name}_schema.txt"
  if [[ ! -f "$schema_file" ]]; then
    echo "Table '$table_name' schema does not exist. Aborting insert."
    return 1
  fi

  local data_file="databases/${database_name}/data_files/${table_name}_data.txt"

  # Check if the data file exists; create one if it doesn't
  if [[ ! -f "$data_file" ]]; then
    touch "$data_file"
  fi

  # Read the schema to get the column names and data types
  local -a columns
  local -a data_types
  local -a is_primary

  # Save the original IFS value
  OLD_IFS=$IFS

  # set the IFS to colon delimiter
  IFS=':'

  while read -r column_name data_type is_primary_key; do
    columns+=("$column_name")
    data_types+=("$data_type")
    is_primary+=("$is_primary_key")
  done < "$schema_file"

  # Restore the original IFS value
  IFS=$OLD_IFS

  local num_columns=${#columns[@]}

  echo "Inserting data into '$table_name':"
  for ((i = 0; i < num_columns; i++)); do
    local column_name=${columns[i]}
    local data_type=${data_types[i]}
    local is_primary_key=${is_primary[i]}
    local value=""

    while true; do

      read -rp "Enter value for '$column_name' (type '$data_type'): " value
      # Validate the data type before proceeding
      if ! validate_data_type "$column_name" "$data_type" "$value"; then
        echo "entered value doesn't match data type value try again"
        continue
      fi
      column_position=$((i+1))
      # check for primary key
      if [ ${is_primary_key} = "y" ]; then
        if ! check_for_duplicates $database_name $table_name $column_position "$value" ; then
          echo "no duplicates allowed for primary key, try again"
          continue
        fi
      fi
      break
    done

    # Use colon (:) as the separator between values
    data_line+="$value:"
  done

  # Remove the trailing colon
  data_line=${data_line%:}

  # Append the data to the data file
  echo "$data_line" >> "$data_file"
  data_line=""
  echo "Data inserted into '$table_name' successfully."
}
