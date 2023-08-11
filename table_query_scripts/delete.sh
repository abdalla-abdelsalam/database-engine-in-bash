#!/bin/bash
delete_lines() {
    local file_name="$1"  # File name is the first argument
    shift  # Shift arguments to remove the file name
    local line_numbers=("$@")  # Remaining arguments are line numbers
    
    # Construct the sed command to delete the specified lines
    sed_command=""
    for line_num in "${line_numbers[@]}"; do
        sed_command="${sed_command}${line_num}d;"
    done

    # Use sed to delete the specified lines from the file in-place
    sed -i "${sed_command}" "$file_name"

    echo "Done"
}

function deleteTable (){
 local database_name=$1
 local table_name
 
  select var in "all" "record" "Exit"
  do
     if [[ $REPLY =~ ^[1-3]$ && -n $REPLY ]] ;then
       case $REPLY in

         1)
           read -rp "Enter tablename "  table_name
           if ! check_valid_name "$table_name" ; then
              return 1
           fi

           deleted_path="databases/${database_name}/data_files/${table_name}_data.txt"

             if [[ -f ${deleted_path} ]];then
                rm -r ${deleted_path}

              if [[ $? -eq 0 ]];then
                echo "all table data has been deleted successfully"
              else
               echo "there is an error to delete the table data"
               return 1
              fi
              
            else
              echo "the table doesn't exist"
              return 1
             fi
            break
             ;;

          2)
            source utility_scripts/condition.sh
            condition ${database_name}
            if [[ $? -ne 0 ]];then
              return 1
            fi
            delete_lines "$data_file" ${numbers[@]}
            break
              ;;
     
         3)
             exit
             ;;

      esac
    else
       echo "please enter valid number"
    fi

   done
  
}
