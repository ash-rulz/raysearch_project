
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select effective_start_date
from "warehouse"."main_trf"."trf_currency_exchange_scd2"
where effective_start_date is null



  
  
      
    ) dbt_internal_test