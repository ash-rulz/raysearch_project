
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select account_type
from "warehouse"."main_trf"."trf_transaction"
where account_type is null



  
  
      
    ) dbt_internal_test