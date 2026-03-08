{{config(
     materialized = 'incremental',
     incremental_strategy ='delete+insert',
     unique_key ='PRODUCT_ID'
     )
}}

with products AS
(SELECT *,
CURRENT_TIMESTAMP AS INSERT_DTS
FROM {{source('PRODUCT', 'PRODUCT_SRC')}}
{%if is_incremental()%}
where CREATED_AT > (SELECT MAX(INSERT_DTS)FROM {{this}})
{%endif%}
)

SELECT *
FROM products