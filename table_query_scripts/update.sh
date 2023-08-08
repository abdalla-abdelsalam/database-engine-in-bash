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
  read -p " set what ? (e.g. 'age = 33') " update_col op new_value
  update_rows ${data_file} ${column_positions["$update_col"]} "$new_value" ${numbers[@]}

  # select_data_from_table ${database_name}  >  temp.file

  # schema_path=./databases/${database_name}/table_definitions//${table_name}_schema.txt
  # update_path=./databases/${database_name}/data_files/${table_name}_data.txt

  # sed -z 's/\n//g;s/\Row:/\n/g;s/  /:/g' temp.file | cut -f2-5 -d: > temp2.file

  #  cat temp2.file
 
  #  read -p  "enter column name to update "  col_name
  #  read -p  "enter column new value : "     new_value


  #  col_index=`awk -v col="$col_name" -F: '{if($1 == col) print NR ;}' $schema_path`
 
  #  old_value_arr=( `cut -d":" -f${col_index} temp2.file  | sed -n '2,$p'` )
  #  old_value=${old_value_arr[0]}
  
  #   if [[ -n ${old_value} ]];then
 
  #       old_value_type=`dataType_validation ${old_value}`
  #       new_value_type=`dataType_validation ${new_value}`

  #      if [[ ${old_value_type} == ${new_value_type} ]];then
        
  #        for i in ${old_value_arr[@]}
  #        do
  #        sed -i "s/${i}/${new_value}/g"    $update_path

  #        if [[ $? -eq 0 ]];then
  #         echo "Data has been deleted successfully"
  #         else
  #         echo "there is an error to update the table data"
  #         fi
  #        done

  #       else
  #        echo "please enter the same data type "

  #       fi
  #  else
  #         echo " old data doesn't exist "
  #       fi

  #  rm temp.file temp2.file


}

# function dataType_validation {

#  local value=$1
#  local type
 
#       if  [[ $value =~ ^[0-9]+$ ]]; then
#         type="int"
#        echo "$type"

#       elif  [[ $value =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]]; then
#         type="float"
#         echo "$type"

#       elif [[ $value =~ ^[a-zA-Z]+$ ]] ; then 
#        type="text"
#        echo "$type"

#        fi
# }
