{{ config(
    materialized='view',
    alias='bronze_stores'
) }}

with source as (
    select * from {{ source('raw', 'stores') }}
),

renamed as (
    select
        store_id,
        store_name,
        store_city,
        store_location,
        store_open_date,
        now() as etl_timestamp
    from source
)

select * from renamed
