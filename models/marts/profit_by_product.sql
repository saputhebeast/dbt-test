{{ config(materialized="view") }}

select product_id, product_name, category, sub_category, sum(profit) as total_profit
from {{ ref("fct_orders") }}
group by 1, 2, 3, 4
order by total_profit desc
