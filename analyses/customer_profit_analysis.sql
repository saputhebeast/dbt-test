select customer_id, sum(profit) as total_profit
from {{ ref("fct_orders") }}
group by customer_id
order by total_profit desc
