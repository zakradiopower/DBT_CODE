{{
    config(materialized= 'view')
}}

WITH VIEW AS(
SELECT *
FROM {{ ref('CUSTOMER') }}
WHERE COUNTRY = 'USA' )
SELECT* FROM VIEW