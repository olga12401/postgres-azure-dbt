{{ config(
    materialized='table',
    alias='silver_sales'
) }}

select
    sale_id,
    date_sales,
    store_id,
    product_id,
    units,
    etl_timestamp
from {{ ref('stg_sales') }}
