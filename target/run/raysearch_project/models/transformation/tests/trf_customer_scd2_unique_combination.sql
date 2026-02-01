
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select customer_id, etl_valid_from, count(*) as cnt
from "warehouse"."main_trf"."trf_customer_scd2"
group by customer_id, etl_valid_from
having count(*) > 1
  
  
      
    ) dbt_internal_test