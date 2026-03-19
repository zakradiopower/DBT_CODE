
select 
  
  orderid as order_id,
  paymentmethod as payment_method,
  status,
  amount,
  created  as created_at,
  _batched_at
  from {{source('stripe', 'payment')}}

