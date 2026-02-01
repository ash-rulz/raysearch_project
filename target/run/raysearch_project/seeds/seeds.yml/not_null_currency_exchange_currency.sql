
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select currency
from "warehouse"."main_raw"."currency_exchange"
where currency is null



  
  
      
    ) dbt_internal_test