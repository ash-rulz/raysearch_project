
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select rate_date
from "warehouse"."main_trf"."trf_currency_exchange"
where rate_date is null



  
  
      
    ) dbt_internal_test