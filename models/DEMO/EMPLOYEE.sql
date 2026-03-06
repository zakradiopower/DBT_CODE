{{config(
    materialized ='table')
}}
with employee as  (
    select
    EMPID, 
    split_part(NAME, ' ', 1) AS FIRST_NAME,
    split_part(NAME, ' ', 2) AS LAST_NAME,
    SALARY,
    HIREDATE,
    split_part(ADDRESS,',', 1) as STREET,
    split_part(ADDRESS,',',2) AS CITY, 
    split_part(ADDRESS,',', 3) AS COUNTRY,
    split_part(ADDRESS,',', 4) AS ZIP_CODE
    from  DBT_DB.PUBLIC.EMPLOYEE_RAW
)

SELECT * FROM employee
