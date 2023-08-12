#!/bin/bash
source database_query_scripts/dropDB.sh
# Function to create a database and return 0 if successful, 1 otherwise
test_drop_database() {  
  test_db_name=$1
  dropDB $test_db_name

  return $?
}

# Run the create_database function and capture the return code
test_drop_database "test_db"
if [[ $? -ne 0 ]];then
  exit 1;
fi