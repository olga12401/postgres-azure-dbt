{{ config(
    materialized='table',
    alias='silver_sales'
) }}

select
    sale_id,
    date_sales,
    store_id,
    prod_id,
    units,
    etl_timestamp
from {{ ref('stg_sales') }}
