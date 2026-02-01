
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select etl_valid_from
from "warehouse"."main_trf"."trf_customer_scd2"
where etl_valid_from is null



  
  
      
    ) dbt_internal_test