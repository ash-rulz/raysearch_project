
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

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



  
  
      
    ) dbt_internal_test