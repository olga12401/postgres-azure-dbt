CREATE TABLE raw.inventory (
    store_id INTEGER,
    product_id INTEGER,
    stock_on_hand INTEGER
);

CREATE TABLE raw.sales (
    sale_id INTEGER NOT NULL PRIMARY KEY,
    date_sales DATE,
    store_id INTEGER,
    product_id INTEGER,
    units INTEGER
);

CREATE TABLE raw.stores (
    store_id INTEGER NOT NULL PRIMARY KEY,
    store_name VARCHAR(255),
    store_city VARCHAR(255),
    store_location VARCHAR(255),
    store_open_date DATE
);

CREATE TABLE raw.products (
    product_id INTEGER NOT NULL PRIMARY KEY,
    product_name VARCHAR(255),
    product_category VARCHAR(255),
    product_cost NUMERIC(5, 2),
    product_price NUMERIC(5, 2)
);

CREATE TABLE raw.calendar (
    calendar_date DATE
);
