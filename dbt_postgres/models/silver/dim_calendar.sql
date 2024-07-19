{{ config(
    materialized='table',
    alias='silver_calendar'
) }}

select
    calendar_date,
    month,
    year,
    week,
    week_day,
    etl_timestamp
from {{ ref('stg_calendar') }}
