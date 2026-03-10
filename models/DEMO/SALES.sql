
{{ config(
    materialized= 'incremental',
    incremental_strategy = 'append'
)
}}


with sales_src AS
(
select *,
current_timestamp AS INSERT_DTS
FROM  {{source('SALES', 'SALES_SRC')}}   --DBT_DB.PUBLIC.SALES_SRC

{%if is_incremental()%}

where CREATED_AT > (select max(INSERT_DTS)from {{this}} )

{%endif%}
)

select *
from sales_src
