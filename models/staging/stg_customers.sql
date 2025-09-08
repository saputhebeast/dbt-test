{{ config(materialized="view") }}

select
    customerid as customer_id,
    customername as customer_name,
    segment as customer_segment,
    country as country,
    state as state
FROM {{ source('raw', 'customers') }}
