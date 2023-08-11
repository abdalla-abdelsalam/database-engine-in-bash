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



function deleteMenu {

  echo -e "\n+-----Delete Menu----------------+"
  echo "| 1. Delete all Records         |"
  echo "| 2. Delete specific Records    |"
  echo "| 3. Return to Table menu        |"
  echo "+-------------------------------+"

}



function deleteTable (){

 local database_name=$1
 local table_name
 
  while true
  do
   
    deleteMenu
    read -rp "please enter delete option  : " Delete_option

     if [[ ${Delete_option} =~ ^[1-3]$ && -n ${Delete_option} ]] ;then
       case ${Delete_option} in

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
              fi
              
            else
              echo "the table doesn't exist"
             fi
             ;;

          2)
            source utility_scripts/condition.sh
            condition ${database_name}
            if [[ $? -ne 0 ]];then
              return 1
            fi
            delete_lines "$data_file" ${numbers[@]}
              ;;
     
         3)
             tableMenu
             ;;

      esac
    else
       echo "please enter valid number"
    fi

   done
  
}
