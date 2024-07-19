CREATE TABLE stg.inventory (
    store_id INTEGER,
    product_id INTEGER,
    stock_on_hand INTEGER
);

CREATE TABLE stg.sales (
    sale_id INTEGER NOT NULL PRIMARY KEY,
    date_sales DATE,
    store_id INTEGER,
    product_id INTEGER,
    units INTEGER
);

-- Dimensional tables

CREATE TABLE dw.stores (
    store_id INTEGER NOT NULL PRIMARY KEY,
    store_name VARCHAR(255),
    store_city VARCHAR(255),
    store_location VARCHAR(255),
    store_open_date DATE
);

CREATE TABLE dw.products (
    product_id INTEGER NOT NULL PRIMARY KEY,
    product_name VARCHAR(255),
    product_category VARCHAR(255),
    product_cost NUMERIC(5, 2),
    product_price NUMERIC(5, 2)
);

CREATE TABLE dw.calendar (
    calendar_date DATE
);
