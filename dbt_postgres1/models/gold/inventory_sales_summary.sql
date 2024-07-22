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
        sales.date_sales,
        sales.store_id,
        sales.prod_id,
        sales.units,
        inventory.stock_on_hand,
        sales.etl_timestamp
    from sales
    left join inventory
        on sales.store_id = inventory.store_id
            and sales.prod_id = inventory.prod_id
)

select * from joined
