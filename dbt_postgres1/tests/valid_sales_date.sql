-- tests/valid_sales_date.sql
with invalid_sales as (
    select *
    from {{ ref('stg_sales') }}
    where date_sales is null or date_sales > current_date
)

select count(*) as invalid_count
from invalid_sales
having invalid_count = 0
