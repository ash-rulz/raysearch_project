-- Transaction fact (daily aggregates) sourced from trf_transaction

with src as (
  select * from {{ ref('trf_transaction') }}
),
dim_cust as (
  select customer_sk, customer_id, etl_valid_from, etl_valid_to
  from {{ ref('dim_customer') }}
),
joined as (
  select
    s.transaction_date,
    d.customer_sk as customer_fk,
    s.customer_id,
    --s.country_code,
    s.account_type,
    s.withdrawal,
    s.deposit,
    s.balance
  from src s
  inner join dim_cust d
    on s.customer_id = d.customer_id
   and s.transaction_date between d.etl_valid_from and d.etl_valid_to
)
select
  transaction_date,
  customer_fk,
  --country_code,
  account_type as account_type_code,
  withdrawal as withdrawal_amt,
  deposit as deposit_amt,
  balance as balance_amt
from joined
