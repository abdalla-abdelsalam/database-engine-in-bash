# database-engine-in-bash 🐱‍🏍
Table of Contents
==================

- [database-engine-in-bash 🐱‍🏍](#database-engine-in-bash-)
- [Table of Contents](#table-of-contents)
  - [Description 🧐](#description-)
  - [Prerequisites](#prerequisites)
  - [Run the project 🚀](#run-the-project-)
  - [Database Features](#database-features)
  - [table features](#table-features)
  - [example usage 🛠](#example-usage-)



## Description 🧐
This Bash project provides a simple database engine with basic functionality for managing databases and tables. It allows you to create, drop, list, and connect to databases. When connected to a database, you can perform various operations on tables including creating, inserting, dropping, selecting, listing, deleting, and updating.


## Prerequisites

1. Make sure you have Bash installed on your system.
2. Download or clone this repository to your local machine.
3. Clone the repo on your machine
```bash
https://github.com/abdalla-abdelsalam/database-engine-in-bash
```
4. Navigate to the directory containing the script files.

## Run the project 🚀
1. Make the `main.sh` script executable using the command `chmod +x main.sh`.
2. Run the project using the following command: 
```bash
./main.sh
```

## Database Features
1. create a database
2. list databases
3. connect to database
4. drop database
   
![db features](https://github.com/abdalla-abdelsalam/database-engine-in-bash/assets/51873396/25d5d708-bbe5-4318-a37e-48b013f9cc72)

## table features
1. create table
2. list tables
3. drop table
4. insert into table
5. select from table
6. delete from table
7. update table
![table features](https://github.com/abdalla-abdelsalam/database-engine-in-bash/assets/51873396/7bf4829c-0f05-4f11-bd89-33fe4b0ce96a)

## example usage 🛠
this show an example of creating a database named test_db then create a table within this database named test_table that contains two columns:
1. id integer primary key 
2. name text
   
after that we will delete a record with specific id and also updating another record, finally we will select the data from the table to see the effects.

1. create a database named test_db
![creat db](https://github.com/abdalla-abdelsalam/database-engine-in-bash/assets/51873396/125e3a45-22e3-4d0f-916c-d576a42c2c71)

2. create a table named test_db with id and name columns
![create table](https://github.com/abdalla-abdelsalam/database-engine-in-bash/assets/51873396/4f868e9a-2cb9-445b-9616-b1fcc1cb3dfa)

3. insert two records into the table
![insert into the table](https://github.com/abdalla-abdelsalam/database-engine-in-bash/assets/51873396/0d1daa76-7512-43cb-b7a1-8cded77cdd92)

4. select the data from the table
![select the data](https://github.com/abdalla-abdelsalam/database-engine-in-bash/assets/51873396/d56f1929-1714-4945-8db9-1cc687263182)

5. delete record with specifc id from the data
![delete record](https://github.com/abdalla-abdelsalam/database-engine-in-bash/assets/51873396/73b910db-d1e6-42bf-81a9-b4cbb469d60b)

6. update table record with specific id

![update record](https://github.com/abdalla-abdelsalam/database-engine-in-bash/assets/51873396/316cae2f-6154-4ff2-8277-57b5f39270a4)

7. select the data after to see the effects
![select again](https://github.com/abdalla-abdelsalam/database-engine-in-bash/assets/51873396/3c6b437f-2abc-482e-b6f6-86382062f191)