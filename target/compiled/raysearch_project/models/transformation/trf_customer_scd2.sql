-- SCD Type 2 using window functions over stg_customer

with src as (
    select
        customer_id,
        country_code,
        customer_state,
        is_vip,
        is_kyc,
        wants_newsletter,
        latest_update_date
    from "warehouse"."main_stg"."stg_customer"
),
-- eliminate duplicates per (customer_id, latest_update_date), keep a single record
unique_per_day as (
    select *
    from (
        select
            *,
            row_number() over (
                partition by customer_id, latest_update_date
                order by latest_update_date desc
            ) as rn
        from src
    ) t
    where rn = 1
),
scd2 as (
    select
        customer_id,
        country_code,
        customer_state,
        is_vip,
        is_kyc,
        wants_newsletter,
        latest_update_date as etl_valid_from,
        lead(latest_update_date) over (
            partition by customer_id
            order by latest_update_date
        ) as next_change_date
    from unique_per_day
)
select
    customer_id,
    country_code,
    customer_state,
    is_vip,
    is_kyc,
    wants_newsletter,
    etl_valid_from,
    case
        when next_change_date is not null then (next_change_date - interval 1 day)::date
        else CAST('9999-12-31' AS DATE)
    end as etl_valid_to,
    case when next_change_date is null then true else false end as is_current
from scd2