-- Fails if any order lacks a joined customer or product
select * from {{ ref("fct_orders") }} where customer_id is null or product_id is null
