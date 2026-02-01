





with validation_errors as (

    select
        currency_code, effective_start_date
    from "warehouse"."main_trf"."trf_currency_exchange_scd2"
    group by currency_code, effective_start_date
    having count(*) > 1

)

select *
from validation_errors


