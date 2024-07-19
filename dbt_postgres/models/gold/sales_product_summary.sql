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
        s.date_sales,
        s.store_id,
        s.product_id,
        s.units,
        p.name as product_name,
        p.category as product_category,
        p.price as product_price,
        p.cost as product_cost,
        s.etl_timestamp
    from sales as s
    left join product as p
    on s.product_id = p.product_id
)

select * from joined
