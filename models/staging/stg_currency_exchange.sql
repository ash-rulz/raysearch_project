with raw as (
    select * from {{ ref('currency_exchange') }}
),
std as (
    select
        try_strptime(cast(date as varchar), '%Y-%m-%d')::date as rate_date,
        currency as currency_code,
        try_cast(baseRateEuro as double) as base_rate_eur
    from raw
)
select * from std
