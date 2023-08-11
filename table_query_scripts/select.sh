#!/bin/bash
print_rows_records_print() {
    local filename="$1"
    local columns_file="$2"
    local column_indices="$3"  # New parameter for specific column indices
    local row_indices="$4"     # New parameter for specific row indices
    
    # Read column names and types from columns file
    while IFS=: read -r col_name col_type; do
        col_names+=("$col_name")
    done < "$columns_file"
    
    # Convert column indices and row indices to arrays
    IFS=',' read -ra col_indices <<< "$column_indices"
    IFS=',' read -ra row_indices <<< "$row_indices"
    
    # Print header row for selected columns
    for index in "${col_indices[@]}"; do
        printf "%-20s |" "${col_names[index - 1]}"
    done
    echo
    
    # Print separator line
    printf "%s\n" "$(printf '+---------------------+' | xargs -n 1 printf %s)"
    
    # Read and process data rows
    current_row_index=1
    while IFS=: read -r line; do
        if [[ " ${row_indices[@]} " =~ " $current_row_index " ]]; then
            IFS=':' read -ra data <<< "$line"
            
            for index in "${col_indices[@]}"; do
                formatted_value="${data[index - 1]}"
                printf "%-20s |" "$formatted_value"
            done
            echo
        fi
        
        ((current_row_index++))
    done < "$filename"
}

select_data_from_table() {
  local database_name=$1
  condition ${database_name}
  if [ $? -ne 0 ];then
    return 1
  fi
  read -rp "enter selected columns you wanna to print seperated by comma (e.g. id,name): " selected_columns
#   if ! check_valid_name "$column_name" ; then
#     return 1
#   fi
  IFS=',' read -ra selected_columns_array <<< "${selected_columns}"
  selected_columns_str=""
  for element in "${selected_columns_array[@]}"; do
    selected_columns_str+="${column_positions[$element]},"
  done
  # Remove the trailing comma
  selected_columns_str=${selected_columns_str%,}

  concatenated=""
  for num in "${numbers[@]}"; do
      if [[ -n "$concatenated" ]]; then
          concatenated="${concatenated},${num}"
      else
          concatenated="$num"
      fi
  done

  print_rows_records_print "$data_file" "$schema_file" "$selected_columns_str" "$concatenated"
}

