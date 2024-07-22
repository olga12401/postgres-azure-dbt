{{ config(
    materialized='table',
    alias='silver_inventory'
) }}

select
    store_id,
    prod_id,
    stock_on_hand,
    etl_timestamp
from {{ ref('stg_inventory') }}
