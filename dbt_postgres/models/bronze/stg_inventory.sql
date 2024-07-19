{{ config(
    materialized='view',
    alias='bronze_inventory'
) }}

with source as (
    select * from {{ source('stg', 'inventory') }}
),

renamed as (
    select
        store_id,
        product_id,
        stock_on_hand,
        now() as etl_timestamp
    from source
)

select * from renamed

