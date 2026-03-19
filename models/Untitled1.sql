{{
config(
    materialized= 'view'
)

}}


with cte as (
select *
from DBT_DB.ANALYTICS.employees
)
select *
from cte
