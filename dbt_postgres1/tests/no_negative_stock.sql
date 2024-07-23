-- tests/no_negative_stock.sql
with negative_stock as (
    select
        *,
        current_timestamp as test_run_timestamp
    from {{ ref('stg_inventory') }}
    where stock_on_hand < 0
)

select count(*) as invalid_stock
from negative_stock
