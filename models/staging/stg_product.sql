{{ config(materialized="view") }}

select
    productid as product_id,
    productname as product_name,
    category as category,
    subcategory as sub_category
from {{ ref("product") }}
