{{ config(materialized="table") }}

select
    o.order_id,
    o.order_date,
    o.ship_date,
    o.ship_mode,
    c.customer_id,
    c.customer_name,
    c.customer_segment,
    c.country,
    c.state,
    p.product_id,
    p.product_name,
    p.category,
    p.sub_category,
    o.order_cost_price,
    o.order_selling_price,
    {{ calculate_profit("o.order_cost_price", "o.order_selling_price") }} as profit
from {{ ref("stg_orders") }} as o
left join {{ ref("stg_customers") }} as c on o.customer_id = c.customer_id
left join {{ ref("stg_product") }} as p on o.product_id = p.product_id
