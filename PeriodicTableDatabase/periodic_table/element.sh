#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Function to get the information from the given element
GET_INFO() {
  # First argument is the value
  # Second argument is the column name in the elements table

  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE $2='$1';")
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE $2='$1';")
  NAME=$($PSQL "SELECT name FROM elements WHERE $2='$1';")

  ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
  MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
  BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")

  TYPE=$($PSQL "SELECT type FROM properties FULL JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER;")

  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
}

ARGUMENT_NAME=""

# Check if there was an argument provided
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  # Finishes.
else
  # Continue the rest of the script

  # Check the argument to know which is it
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ARG_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1;")
  else
    ARG_ATOMIC_NUMBER=""
  fi
  ARG_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol='$1';")
  ARG_NAME=$($PSQL "SELECT name FROM elements WHERE name='$1';")
  
  if [[ ! -z $ARG_ATOMIC_NUMBER ]]
  then
    ARGUMENT_NAME='atomic_number'
    GET_INFO $1 $ARGUMENT_NAME
  elif [[ ! -z $ARG_SYMBOL ]]
  then
    ARGUMENT_NAME='symbol'
    GET_INFO $1 $ARGUMENT_NAME
  elif [[ ! -z $ARG_NAME ]]
  then
    ARGUMENT_NAME='name'
    GET_INFO $1 $ARGUMENT_NAME
  else
    echo "I could not find that element in the database."
  fi
  
fi
