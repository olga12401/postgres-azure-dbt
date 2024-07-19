{{ config(
    materialized='table',
    alias='silver_inventory'
) }}

select
    store_id,
    product_id,
    stock_on_hand,
    etl_timestamp
from {{ ref('stg_inventory') }}
