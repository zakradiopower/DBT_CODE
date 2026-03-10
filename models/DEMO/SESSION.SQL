{{
    config(
        materialized = 'table'
    )
}}
with cte as (
    SELECT
    SESSION_ID,
    USER_ID,
    BROWSER,
    DEVICE_TYPE,
    PAGES_VISITED,
    START_TIME,
    END_TIME,
    b.country_name,
    b.continent,
    b.currency,
    CURRENT_TIMESTAMP AS INSERT_DTS 
    FROM {{source('session', 'SESSION_SRC')}} a
    LEFT JOIN {{ref('country_code')}} b 
    ON a.COUNTRY_CODE = b.country_code
)
select*
from cte