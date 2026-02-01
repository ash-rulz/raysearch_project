
  
  create view "warehouse"."main_stg"."stg_currency_exchange__dbt_tmp" as (
    with raw as (
    select * from "warehouse"."main_raw"."currency_exchange"
),
typed as (
    select
        try_strptime(cast(date as varchar), '%Y-%m-%d')::date as rate_date,
        currency as currency_code,
        try_cast(baseRateEuro as double) as base_rate_eur
    from raw
),
validated as (
    select *
    from typed
    where rate_date is not null
      and currency_code is not null
      and base_rate_eur is not null
)
select * from validated
  );
