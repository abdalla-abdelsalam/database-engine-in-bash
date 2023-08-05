#!/bin/bash


function update {

 local table_name
 
  read -p " enter table name " $table_name
   
   if [[ -f ${table_name}_schema.txt || -f ${table_name}_data.txt  ]]; then

    read -p "enter  condition column name : " column_name
    read -p "enter  condition column value : " column_value

    #record=select $column_name $column_value ${table_name}_data.txt
    echo  "$record"
    
     read -p "enter column name to update: " col_name
     read -p "enter column old value : "     old_value
     read -p "enter column new value  : "    column_new_value

      #get old column value index 
     col_index=`cat $record | awk -F:'{for {i=1;i<=NF;i++}{if ($old_value == $i) print i }}'` 

       #get column type of old value
       arr=( `cut -d":" -f2  ${table_name}_data.txt ` )
        for ((i=1;i<=${#arr[@]};i++))
         do

           if [[ $col_index -eq $i ]];then
              col_Type=${arr[i]}
           fi
      
        done

      #validate new column dataType
     if  validate_data_type $col_name $col_Type $column_new_value  ;then
       sed "s/$old_value/$column_new_value"  ${table_name}_data.txt
     
        if [[ $? -eq 0 ]];then
         echo "column has been updated  successfully"
        else
         echo "there is an error to update column"
        fi

      fi

  else
    echo "table doesn't exist"

  fi

}
