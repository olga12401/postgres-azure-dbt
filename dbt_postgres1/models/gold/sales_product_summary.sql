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
        sales.prod_id,
        sales.units,
        product.prod_name,
        product.prod_category,
        product.prod_price,
        product.prod_cost,
        sales.etl_timestamp
    from sales
    left join product
        on sales.prod_id = product.prod_id
)

select * from joined
