
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select customerId as from_field
    from "warehouse"."main_raw"."transaction"
    where customerId is not null
),

parent as (
    select customerID as to_field
    from "warehouse"."main_raw"."customer"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test