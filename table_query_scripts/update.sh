#!/bin/bash
source utility_scripts/condition.sh

update_rows() {
    local file="$1"       # File name
    shift
    local column="$1"     # Column number to update
    shift
    local update_value="$1" # Value to update with
    shift
    local lines=("$@") 

    # Set the field separator to ":"
    local FS=":"

    # Loop through each line number in the array
    for line_num in "${lines[@]}"; do
        # Use AWK to update the specified column of the specified line with the update value
        awk -v col="$column" -v val="$update_value" -v line="$line_num" -v FS="$FS" '
            BEGIN { OFS = FS }   # Set the output field separator to the same as input field separator
            NR == line { $col = val }  # For the specified line, update the specified column
            { print }                  # Print the updated line or other lines as is
        ' "$file" > temp_file && mv temp_file "$file"
    done
}

function updateTable {

  local database_name=$1
  condition ${database_name}
  if [[ $? -ne 0 ]];then
    return 1
  fi
  read -rp " set what ? (e.g. 'age = 33') " update_col op new_value

  if ! check_valid_name "$update_col" ; then
    return 1
  fi

  if [[ -z ${column_positions["$update_col"]} ]]; then
    echo "Column '$update_col' does not exist in the schema."
    return 1
  fi
  

  if [[ "$op" != '=' ]];then
    echo "the operator must be = "
    return 1
  fi
  
  update_rows ${data_file} ${column_positions["$update_col"]} "$new_value" ${numbers[@]}

}