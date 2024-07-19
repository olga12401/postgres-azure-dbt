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
        extract(month from calendar_date) as month,
        extract(year from calendar_date) as year,
        extract(week from calendar_date) as week,
        extract(dow from calendar_date) as week_day,
        now() as etl_timestamp
    from source
)

select * from renamed


