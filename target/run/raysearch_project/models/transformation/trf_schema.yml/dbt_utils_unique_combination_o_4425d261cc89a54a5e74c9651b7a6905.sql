
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  





with validation_errors as (

    select
        transaction_date, customer_id, country_code, account_type
    from "warehouse"."main_trf"."trf_transaction"
    group by transaction_date, customer_id, country_code, account_type
    having count(*) > 1

)

select *
from validation_errors



  
  
      
    ) dbt_internal_test