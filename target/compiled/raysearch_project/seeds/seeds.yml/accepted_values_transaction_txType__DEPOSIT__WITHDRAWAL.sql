
    
    

with all_values as (

    select
        txType as value_field,
        count(*) as n_records

    from "warehouse"."main_raw"."transaction"
    group by txType

)

select *
from all_values
where value_field not in (
    'DEPOSIT','WITHDRAWAL'
)


