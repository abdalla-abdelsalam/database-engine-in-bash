#!/bin/bash
source database_query_scripts/createDB.sh
# Function to create a database and return 0 if successful, 1 otherwise
test_create_database() {

  test_db_name=$1
  createDB $test_db_name

  return $?
}

# Run the create_database function and capture the return code
test_create_database "test_db"
if [[ $? -ne 0 ]];then
  exit 1;
fi