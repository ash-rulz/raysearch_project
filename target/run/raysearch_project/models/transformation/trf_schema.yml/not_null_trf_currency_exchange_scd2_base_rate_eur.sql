
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select base_rate_eur
from "warehouse"."main_trf"."trf_currency_exchange_scd2"
where base_rate_eur is null



  
  
      
    ) dbt_internal_test