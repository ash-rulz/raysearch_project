
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select is_current
from "warehouse"."main_trf"."trf_customer_scd2"
where is_current is null



  
  
      
    ) dbt_internal_test