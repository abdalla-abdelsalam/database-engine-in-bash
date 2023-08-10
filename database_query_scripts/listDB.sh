#!/bin/bash


#function to list existed Databases
function listDB {

  current_databases=`ls ./databases`

   #condtion to check if there ara databases or not
    if [[ -n $current_databases ]] ;then
        ls  "./databases"
    else
        echo "no databases found"
    fi

 }

