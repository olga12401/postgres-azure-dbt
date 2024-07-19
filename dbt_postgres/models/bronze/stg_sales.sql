{{ config(
    materialized='view',
    alias='bronze_sales'
) }}

select
    sale_id,  
    date_sales,  
    store_id,
    product_id,
    units,
    now() as etl_timestamp
from {{ source('stg', 'sales') }}


