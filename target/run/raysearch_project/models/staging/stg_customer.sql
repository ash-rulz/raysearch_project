
  
  create view "warehouse"."main_stg"."stg_customer__dbt_tmp" as (
    with raw as (
    select * from "warehouse"."main_raw"."customer"
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
  );
