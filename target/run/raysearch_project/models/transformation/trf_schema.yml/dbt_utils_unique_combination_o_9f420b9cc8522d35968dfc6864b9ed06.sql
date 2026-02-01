
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  





with validation_errors as (

    select
        rate_date, currency_code
    from "warehouse"."main_trf"."trf_currency_exchange"
    group by rate_date, currency_code
    having count(*) > 1

)

select *
from validation_errors



  
  
      
    ) dbt_internal_test