# postgres-azure-dbt

## Overview

This project demonstrates the implementation of a dimensional model on a remote PostgreSQL database hosted on Azure, using Pentaho Data Integration (PDI) for ETL processes.

## Prerequisites

1. Azure service
2. Postgres DB , DBeaver
3. Pentaho Data Integration (PDI)
3. Git
4. Dataset Maven toys
5. DBT
6. python
7. VScode


### Git

1. Create a new repository
2. in VScode create a new branch, in the branch create a new file readme.md and create a PR for this change.

### Azure Database for PostgreSQL flexible server

First, let's create a new server for our databse on the portal Azure.

1. Go to Azure portal
2. Create a new resource group
3. Greate a resourse - > choose Databases -> Azure Database for PostgreSQL
4. Configure the PostgreSQL Server
   
   Fill in the required details:

    - Subscription: Choose your subscription.

    - Resource Group: Select an existing resource group or create a new one.

    - Server Name: Provide a unique name for your PostgreSQL server.

    - Data Source: Choose "None" unless you are restoring from a backup.

    - Location: Select the Azure region where you want to host your server.

    - Version: Choose the PostgreSQL version you prefer.

    - Compute + Storage: Configure the number of vCores and the amount of storage.

    - Administrator Account: Set the admin username and password.

    - Configure Firewall Rules:

      - Add your IP address or a range of IP addresses to the firewall rules to allow connections.

### Load data to PostgreSQL

1. Go to DBeaver. If you din't have, install it. 
2. Open DBeaver
3. Click on  - >  to Database - > New Database Connection.
4. Select ```PostgreSQL``` from the list of database drivers and click ```Next```.

```
  - Host: your-db-host
   - Port: 5432
   - Database: your-db-name
   - Username: your-db-user
   - Password: your-db-password
```

5. Click ```Test Connection``` to ensure that the connection details are correct. Click ```OK``` to save the connection.

6. In DBeaver create schemas STG and DW for the tables by running below SQL Scripts:

- Scriptis to create tables in STG and DW scheme to load the raw data: **create_tables.sql**

### ETL process

The ETL (Extract, Transform, Load) process is handled by Pentaho Data Integration (PDI). The process involves extracting data from source (in our case the data is in CSV), transforming it into the desired format, and loading it into the PostgreSQL database on Azure. Jobs and Transformations are located in ETL.

1. Install Data Integration
2. Open PDI -> Create a new file (tupe transformation) -> Go to design tab 
3. Input folder -> CSV file Input -> drag it to new file. Configure it.
4. Output folder -> Table output -> drag it and configurete. Go to the Database Connections and set up a new connection using the details of your DB. test connection.
5. Add a new hop connection between 2 steps.
6. Save and run.

![alt text](image.png)

7. We need to extract and load 5 tables: ``` calendar ```, ```sales```, ```products```, ```inventory```, ```stores```. 
8. Open DBeaver and run the following queries to check the loaded data:

```
select count(*) from dw.calendar;
select count(*) from dw.products;
select count(*) from dw.stores;
select count(*) from stg.inventory;
select count(*) from stg.sales;

```

### Build models using dbt Core

