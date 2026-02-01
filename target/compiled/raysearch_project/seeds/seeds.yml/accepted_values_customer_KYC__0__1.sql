
    
    

with all_values as (

    select
        KYC as value_field,
        count(*) as n_records

    from "warehouse"."main_raw"."customer"
    group by KYC

)

select *
from all_values
where value_field not in (
    '0','1'
)


