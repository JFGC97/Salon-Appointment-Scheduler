# Salon-Appointment-Scheduler

Salon.sql - database dump

* All tasks solved in this database dump

    You should create a database named salon
    
    You should connect to your database, then create tables named customers, appointments, and services
    
    Each table should have a primary key column that automatically increments
    
    Each primary key column should follow the naming convention, table_name_id. For example, the customers table should have a customer_id key. Note that there’s no s at the end of customer
    
    Your appointments table should have a customer_id foreign key that references the customer_id column from the customers table
    
    Your appointments table should have a service_id foreign key that references the service_id column from the services table
    
    Your customers table should have phone that is a VARCHAR and must be unique
    
    Your customers and services tables should have a name column
    
    Your appointments table should have a time column that is a VARCHAR
    
    You should have at least three rows in your services table for the different services you offer, one with a service_id of 1

salon.sh - Interactive Bash program that uses PostgreSQL to track the customers and appointments for your salon.

* All tasks below were solved in this script's
    
    You should create a script file named salon.sh in the project folder
    
    Your script file should have a “shebang” that uses bash when the file is executed (use #! /bin/bash)
    
    Your script file should have executable permissions
    
    You should not use the clear command in your script
    
    You should display a numbered list of the services you offer before the first prompt for input, each with the format #) <service>. For example, 1) cut, where 1 is the service_id
    
    If you pick a service that doesn't exist, you should be shown the same list of services again
    
    Your script should prompt users to enter a service_id, phone number, name if they aren’t already a customer and a time. You should use read to read these inputs into variables named SERVICE_ID_SELECTED, CUSTOMER_PHONE, CUSTOMER_NAME, and SERVICE_TIME
