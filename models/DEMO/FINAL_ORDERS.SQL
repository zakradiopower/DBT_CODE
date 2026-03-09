{{config(
    materialized= 'table'
)}}


WITH CTE AS (
    SELECT *,
    CURRENT_TIMESTAMP AS INSERT_DTS
    FROM {{ ref('CLEAN_ORDERS') }}
)

SELECT *
FROM CTE