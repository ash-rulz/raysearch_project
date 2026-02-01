
    
    

with child as (
    select txCurrency as from_field
    from "warehouse"."main_raw"."transaction"
    where txCurrency is not null
),

parent as (
    select currency as to_field
    from "warehouse"."main_raw"."currency_exchange"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


