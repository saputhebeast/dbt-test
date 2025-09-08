-- Fails if any order has negative profit (adjust if negatives are valid)
select * from {{ ref("fct_orders") }} where profit < 0
