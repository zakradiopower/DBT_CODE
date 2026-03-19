with orders as (
select
    id as order_id,
    user_id as customer_id,
    order_date,
    status
from {{source('jaffle_shop', 'orders')}}
),
pivoted as ( 
    select order_id,  
    {% set order_status = ['placed', 'shipped', 'delivered', 'completed'] %}
    {%for status in order_status %}
       count(case
                  when status = '{{status}}' then 1 else 0 end) as {{status}}count
    {%if not loop.last %}
          ,
    {%endif%}        
    {%endfor%}
    from orders
    group by 1

)
select *
from pivoted 