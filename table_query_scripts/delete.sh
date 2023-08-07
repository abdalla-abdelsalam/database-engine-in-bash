#!/bin/bash

function deleteTable (){

 local database_name=$1
 local table_name
 
  select var in "all" "record" "Exit"
  do
     if [[ $REPLY =~ ^[1-3]$ && -n $REPLY ]] ;then
       case $REPLY in

         1)
           read -p "Enter tablename "  table_name

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
            select_data_from_table ${database_name} > temp.file 
           
            deleted_path=./databases/${database_name}/data_files/${table_name}_data.txt

           if [[ -n temp.file ]];then    
	
            #change the out of select to be the same of  data file
            sed -z 's/\n//g;s/\Row:/\n/g;s/  /:/g' temp.file | cut -f2-5 -d: > temp2.file
            
            for i in `cat temp2.file`   
             do 
              sed -i "/${i}/d"  ${deleted_path}
              if [[ $? -eq 0 ]];then
               echo "record has been deleted successfully" 
              else
               echo "there is an error to delete record"          
              fi
             done
             rm temp.file  temp2.file
    
           else 
            echo "not date found"
           fi

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

