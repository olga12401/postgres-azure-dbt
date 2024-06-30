CREATE TABLE stg.inventory (
	Store_ID INTEGER,
	Product_ID INTEGER,
	Stock_On_Hand INTEGER
) ;

CREATE TABLE stg.sales (
    sale_id INTEGER NOT NULL PRIMARY KEY,
    date_sales DATE,
    store_id INT,
    product_id INT,
    units INT
);

-- dimentional tables

CREATE TABLE dw.stores (
    Store_ID INTEGER NOT NULL PRIMARY KEY,
    Store_Name VARCHAR(255),
    Store_City VARCHAR(255),
    Store_Location VARCHAR(255),
    Store_Open_Date DATE
);

CREATE TABLE dw.products (
    Product_ID INTEGER NOT NULL primary key ,
    Product_Name VARCHAR(255),
    Product_Category VARCHAR(255),
    Product_Cost NUMERIC(5,2),
    Product_Price NUMERIC(5,2)
);

CREATE TABLE dw.calendar (
    calendar_date DATE
);