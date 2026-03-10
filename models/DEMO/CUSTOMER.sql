{{config(
    materialized= 'table')

}}

with customer as 
( SELECT *,

CURRENT_TIMESTAMP AS INSERT_DTS
FROM  {{source('CUSTOMER', 'CUSTOMER_SRC')}}              --DBT_DB.PUBLIC.CUSTOMER_SRC
)

select *
from customer