-- tests/no_negative_stock.sql
with negative_stock as (
    select *
    from {{ ref('stg_inventory') }}
    where stock_on_hand < 0
)

select count(*) as invalid_count
from negative_stock
having invalid_count = 0
