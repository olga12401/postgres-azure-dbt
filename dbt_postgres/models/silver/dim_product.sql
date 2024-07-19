{{ config(
    materialized='table',
    alias='silver_product'
) }}

select
    product_id,
    name,
    category,
    cost,
    price,
    etl_timestamp
from {{ ref('stg_product') }}
