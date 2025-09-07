{{ config(materialized="table") }}

select
    cast(orderid as int64) as order_id,
    parse_date('%Y/%m/%d', orderdate) as order_date,
    parse_date('%Y/%m/%d', shipdate) as ship_date,
    shipmode as ship_mode,
    customerid as customer_id,
    productid as product_id,
    cast(ordercostprice as numeric) as order_cost_price,
    cast(ordersellingprice as numeric) as order_selling_price
from {{ source("raw", "orders") }}
