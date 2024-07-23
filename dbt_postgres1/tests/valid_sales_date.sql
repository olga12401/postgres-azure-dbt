-- tests/valid_sales_date.sql
with invalid_sales as (
    select
        *,
        current_date as today_date
    from {{ ref('stg_sales') }}
    where date_sales is null or date_sales > current_date
)

select *
from invalid_sales
