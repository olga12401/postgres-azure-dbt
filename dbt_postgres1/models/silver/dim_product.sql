{{ config(
    materialized='table',
    alias='silver_product'
) }}

select
    prod_id,
    prod_name,
    prod_category,
    prod_cost,
    prod_price,
    etl_timestamp
from {{ ref('stg_product') }}
