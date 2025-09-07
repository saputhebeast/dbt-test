{{ config(materialized="view") }}

select
    customer_id, customer_name, customer_segment, country, sum(profit) as total_profit
from {{ ref("fct_orders") }}
group by 1, 2, 3, 4
order by total_profit desc
