{{ config(
    materialized='view',
    alias='bronze_product'
) }}

with source as (
    select * from {{ source('dw', 'products') }}
),

renamed as (
    select
        product_id,
        product_name as name,
        product_category as category,
        product_cost as cost,
        product_price as price,
        now() as etl_timestamp
    from source
)

select * from renamed
