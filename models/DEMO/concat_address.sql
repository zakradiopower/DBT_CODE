{{
    config (
        materialized ='table'
    )
}}

select {{ concat_macro('1233 maple st', 'British Columbia')  }} as address