{{ config(
    materialized='view',
    alias='bronze_inventory'
) }}

with source as (
    select * from {{ source('raw', 'inventory') }}
),

renamed as (
    select
        store_id,
        product_id as prod_id,
        stock_on_hand,
        now() as etl_timestamp
    from source
)

select * from renamed
