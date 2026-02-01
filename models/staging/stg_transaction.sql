with raw as (
    select * from {{ ref('transaction') }}
),
std as (
    select
        try_strptime(date, '%m/%d/%Y')::date as transaction_date,
        try_cast(amount as double) as amount,
        channelUID as channel,
        txCurrency as currency,
        accountType as account_type,
        txType as transaction_type,
        customerId as customer_id
    from raw
)
select * from std
