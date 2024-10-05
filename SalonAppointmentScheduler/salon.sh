#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -q -t -c"

echo -e "\n~~~Welcome to the Salon Appointment Scheduler~~~\n"

MAIN_MENU(){
  # If an input message is provided, print it
  if [[ ! -z $1 ]]
  then
    echo -e "$1"
  fi

  # Display list of services like #) service_name
  echo "The available services are:"
  echo "$($PSQL "SELECT * FROM services;")" | while read SERVICE_ID BAR SERVICE_NAME
  do
    # Check if SERVICE_ID is a number
    if [[ $SERVICE_ID =~ ^[0-9]+$ ]]
    then
      echo "$SERVICE_ID) $SERVICE_NAME"
    fi
  done

  # Ask to select a service
  echo -e "\nPlease select one of the above services:"
  read SERVICE_ID_SELECTED

  # Check if the selected service is one of the listed ones
  SERVICE_IS_LISTED=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
  if [[ ! -z $SERVICE_IS_LISTED ]]
  then
    # Ask for phone number
    echo -e "\nPlease insert your phone number:"
    read CUSTOMER_PHONE

    # Check if customer already in the database
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")

    # If not, ask for name
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nPlease insert your name:"
      read CUSTOMER_NAME

      # Add customer to the database
      echo $($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME');")
    fi

    # Ask for a time
    echo -e "\nPlease insert the time for the appointment:"
    read SERVICE_TIME

    # Get customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")

    # Create the appointment in the database
    echo $($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")

    # Get service name
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;")

    # Output message
    echo "I have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

  else
  # If picked a wrong service, show the list again
  MAIN_MENU "\nThe selected service isn't on the list."
  fi
}

MAIN_MENU

# Ask the user to enter (using read):
  # service_id SERVICE_ID_SELECTED
  # phone CUSTOMER_PHONE
  # name (if not already a customer) CUSTOMER_NAME
  # time (date?) SERVICE_TIME

# If phone doesn't exist, ask for name and add both to customers table

# Create a row in the appointments table after these inputs:
# 1
# 555-555-5555
# Fabio
# 10:30

# Create another row in the appointments table after these inputs:
# 2
# 555-555-5555
# 11am

# After an appointment is successfully added, we must output the message:
# I have put you down for a <service> at <time>, <name>.
# and then the script ends.