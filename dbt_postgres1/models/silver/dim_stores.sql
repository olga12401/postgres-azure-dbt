{{ config(
    materialized='table',
    alias='silver_stores'
) }}

select
    store_id,
    store_name,
    store_city,
    store_location,
    store_open_date,
    etl_timestamp
from {{ ref('stg_stores') }}
