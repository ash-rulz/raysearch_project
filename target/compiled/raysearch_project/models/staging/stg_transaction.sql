with raw as (
    select * from "warehouse"."main_raw"."transaction"
),
typed as (
    select
        try_strptime(date, '%m/%d/%Y')::date as transaction_date,
        try_cast(amount as double) as amount,
        channelUID as channel,
        txCurrency as currency,
        accountType as account_type,
        txType as transaction_type,
        customerId as customer_id
    from raw
),
validated as (
    select *
    from typed
    where transaction_date is not null
      and amount is not null
      and transaction_type in ('DEPOSIT','WITHDRAWAL')
      and currency is not null
),
with_valid_customers as (
    select t.*
    from validated t
    inner join "warehouse"."main_stg"."stg_customer" c
        on t.customer_id = c.customer_id
)
select * from with_valid_customers