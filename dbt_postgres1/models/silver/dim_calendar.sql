{{ config(
    materialized='table',
    alias='silver_calendar'
) }}

select
    calendar_date,
    month_num,
    year_num,
    week_num,
    weekday_num,
    etl_timestamp
from {{ ref('stg_calendar') }}
