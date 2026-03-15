with cte as (
select 
  
  orderid as order_id,
  paymentmethod as payment_method,
  status,
  amount,
  created  as created_at
  from {{source('payment', 'payment')}}

)
select *
from cte