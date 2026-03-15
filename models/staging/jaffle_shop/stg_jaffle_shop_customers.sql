with cte as(
select
    id as customer_id,
    first_name,
    last_name
from {{source('customers', 'customers')}}
)
 select* 
 from cte