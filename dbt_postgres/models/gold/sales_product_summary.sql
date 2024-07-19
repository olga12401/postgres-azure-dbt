{{ config(
    materialized='table',
    alias='sales_product_summary'
) }}

with sales as (
    select
        *
    from {{ ref('mrt_sales') }}
),

product as (
    select
        *
    from {{ ref('dim_product') }}
),

joined as (
    select
        sales.date_sales,
        sales.store_id,
        sales.product_id,
        sales.units,
        product.name as product_name,
        product.category as product_category,
        product.price as product_price,
        product.cost as product_cost,
        sales.etl_timestamp
    from sales
    left join product
        on sales.product_id = product.product_id
)

select * from joined
