{{ config(
    materialized='view',
    alias='bronze_calendar'
) }}

with source as (
    select * from {{ source('dw', 'calendar') }}
),

renamed as (
    select
        calendar_date,
        extract(month from calendar_date) as month_num,
        extract(year from calendar_date) as year_num,
        extract(week from calendar_date) as week_num,
        extract(dow from calendar_date) as weekday_num,
        now() as etl_timestamp
    from source
)

select * from renamed
