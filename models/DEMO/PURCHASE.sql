{{config(
    materialized= 'incremental',
    incremental_strategy='merge',
    unique_key='PURCHASE_ID',
    merge_exclude_columns =['INSERT_DTS']
)}}

with cte as 
( 
SELECT *,
CURRENT_TIMESTAMP as INSERT_DTS,
CURRENT_TIMESTAMP AS UPDATE_DTS

FROM {{source('PURCHASE', 'PURCHASE_SRC')}}

{% if is_incremental()%}

where CREATED_AT > (SELECT max(UPDATE_DTS)FROM {{this}})

{%endif%}
)
select *
from cte