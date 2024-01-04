#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"

SERVICE_SELECTION() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\nWelcome to My Salon, how can I help you?"
  echo -e "\n1) cut\n2) color\n3) perm"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) CUT_MENU ;;
    2) COLOR_MENU ;;
    3) PERM_MENU ;;
    *) SERVICE_SELECTION "I could not find that service. What would you like today?" ;;
  esac
}

CUT_MENU() {
  SCHEDULE_SERVICE
}


COLOR_MENU() {
  SCHEDULE_SERVICE
}

PERM_MENU() {
  SCHEDULE_SERVICE
}

SCHEDULE_SERVICE() {
  #get customer_info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  #if not found 
  if [[ -z $CUSTOMER_ID ]]
  then
    #get name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    #get schedule
    echo -e "\nWhat time would you like your$SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME

    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
 
  #if found
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo -e "\nWhat time would you like your$SERVICE_NAME,$CUSTOMER_NAME?"
    read SERVICE_TIME
  fi
  #Update customer_ID
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  
  #Insert_table_appointments
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME,$CUSTOMER_NAME."
}

SERVICE_SELECTION
