
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select latestUpdate
from "warehouse"."main_raw"."customer"
where latestUpdate is null



  
  
      
    ) dbt_internal_test