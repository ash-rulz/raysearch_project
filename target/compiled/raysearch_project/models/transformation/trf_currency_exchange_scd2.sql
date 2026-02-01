with daily as (
    select * from "warehouse"."main_stg"."stg_currency_exchange"
),
scd2 as (
    select
        currency_code,
        base_rate_eur,
        rate_date as etl_valid_from,
        lead(rate_date) over (
            partition by currency_code
            order by rate_date
        ) as next_rate_date
    from daily
)
select
    currency_code,
    base_rate_eur,
    etl_valid_from,
    case
        when next_rate_date is not null then (next_rate_date - interval 1 day)::date
        else CAST('9999-12-31' AS DATE)
    end as etl_valid_to,
    case when next_rate_date is null then true else false end as is_current
from scd2