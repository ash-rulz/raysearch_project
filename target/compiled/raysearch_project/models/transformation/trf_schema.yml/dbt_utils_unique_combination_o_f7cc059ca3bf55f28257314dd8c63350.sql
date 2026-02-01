





with validation_errors as (

    select
        customer_id, etl_valid_from
    from "warehouse"."main_trf"."trf_customer_scd2"
    group by customer_id, etl_valid_from
    having count(*) > 1

)

select *
from validation_errors


