#!/bin/bash


function updateTable {

 local database_name=$1
 
  update_path=./databases/${database_name}/data_files/hossam_data.txt

  select_data_from_table ${database_name}  >  temp.file
  
  sed -z 's/\n//g;s/\Row:/\n/g;s/  /:/g' temp.file | cut -f2-5 -d: > temp2.file

   cat temp2.file
  
   read -p "enter value column old value  : "  old_value
   read -p  "enter value column new value : "  new_value
        
   test_old_value=`grep $old_value temp2.file`
   if [[ $? -eq 0 ]];then
 
        old_v=`dataType_validation ${old_value}`
        new_v=`dataType_validation ${new_value}`

       if [[ ${old_v} == ${new_v} ]];then

        sed -i "s/${old_value}/${new_value}/g"    $update_path
   
         if [[ $? -eq 0 ]];then
          echo "Data has been deleted successfully"
          else
          echo "there is an error to update the table data"
          fi

        else
         echo "please enter the same data type "

        fi
   else
          echo " old data doesn't exist "
        fi

   rm temp.file temp2.file


}

function dataType_validation {

 local value=$1
 local type
 
      if  [[ $value =~ ^[0-9]+$ ]]; then
        type="int"
       echo "$type"

      elif  [[ $value =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]]; then
        type="float"
        echo "$type"

      elif [[ $value =~ ^[a-zA-Z]+$ ]] ; then 
       type="text"
       echo "$type"

       fi
}
