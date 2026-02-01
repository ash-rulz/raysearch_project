
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select baseRateEuro
from "warehouse"."main_raw"."currency_exchange"
where baseRateEuro is null



  
  
      
    ) dbt_internal_test