{{ config(
    materialized='view',
    alias='bronze_product'
) }}

with source as (
    select * from {{ source('dw', 'products') }}
),

renamed as (
    select
        product_id as prod_id,
        product_name as prod_name,
        product_category as prod_category,
        product_cost as prod_cost,
        product_price as prod_price,
        now() as etl_timestamp
    from source
)

select * from renamed
