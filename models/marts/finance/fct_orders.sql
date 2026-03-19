
with customers as 
(select*
from {{ ref('stg_jaffle_shop_orders') }}
),
orders as (
    SELECT *
    FROM {{ ref('stg_stripe_payments') }}
    where STATUS = 'success'
),

customer_order as 
(SELECT 
a.ORDER_ID,
a.CUSTOMER_ID,
a.status as order_status,
b.AMOUNT,
b.payment_method,
b.created_at
FROM customers a
INNER JOIN orders b  
using(ORDER_ID)
)

select 
order_id,
customer_id,
amount
from customer_order