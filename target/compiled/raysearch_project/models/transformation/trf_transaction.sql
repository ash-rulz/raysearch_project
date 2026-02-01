with st as (
    select * from "warehouse"."main_stg"."stg_transaction"
),
cust as (
    select * from "warehouse"."main_trf"."trf_customer_scd2"
),
curr_exc as (
    select * from "warehouse"."main_trf"."trf_currency_exchange"
),
joined as (
    select
        st.transaction_date,
        st.customer_id,
        cust.country_code,
        st.account_type,
        st.transaction_type,
        st.amount * curr_exc.base_rate_eur as amount
    from st
    inner join cust
        on st.customer_id = cust.customer_id
       and st.transaction_date between cust.etl_valid_from and cust.etl_valid_to
    left join curr_exc
        on st.transaction_date = curr_exc.rate_date
       and st.currency = curr_exc.currency_code
),
agg as (
    select
        transaction_date,
        customer_id,
        country_code,
        account_type,
        sum(case when transaction_type = 'WITHDRAWAL' then amount else 0 end) as withdrawal,
        sum(case when transaction_type = 'DEPOSIT' then amount else 0 end) as deposit
    from joined
    group by transaction_date, customer_id, country_code, account_type
)
select * from agg