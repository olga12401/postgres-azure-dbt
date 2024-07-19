{{ config(
    materialized='table',
    alias='inventory_sales_summary'
) }}

with sales as (
    select
        *
    from {{ ref('mrt_sales') }}
),

inventory as (
    select
        *
    from {{ ref('mrt_inventory') }}
),

joined as (
    select
        s.date_sales,
        s.store_id,
        s.product_id,
        s.units,
        i.stock_on_hand,
        s.etl_timestamp
    from sales as s
    left join inventory as i
    on s.store_id = i.store_id and s.product_id = i.product_id
)

select * from joined
