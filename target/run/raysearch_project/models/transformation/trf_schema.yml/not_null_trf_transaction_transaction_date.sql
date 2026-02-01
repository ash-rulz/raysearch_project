
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select transaction_date
from "warehouse"."main_trf"."trf_transaction"
where transaction_date is null



  
  
      
    ) dbt_internal_test