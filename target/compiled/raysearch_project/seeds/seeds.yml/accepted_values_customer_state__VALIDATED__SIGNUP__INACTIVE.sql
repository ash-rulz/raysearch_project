
    
    

with all_values as (

    select
        state as value_field,
        count(*) as n_records

    from "warehouse"."main_raw"."customer"
    group by state

)

select *
from all_values
where value_field not in (
    'VALIDATED','SIGNUP','INACTIVE'
)


