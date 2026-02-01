with raw as (
    select * from {{ ref('customer') }}
),
std as (
    select
        customerID as customer_id,
        country as country_code,
        state as customer_state,
        VIP as is_vip,
        KYC as is_kyc,
        wantsNewsletter as wants_newsletter,
        try_strptime(latestUpdate, '%m/%d/%Y')::date as latest_update_date
    from raw
)
select * from std
