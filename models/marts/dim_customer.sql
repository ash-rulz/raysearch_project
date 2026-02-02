-- Customer dimension (SCD2) sourced from trf_customer_scd2

with src as (
  select * from {{ ref('trf_customer_scd2') }}
)
,
numbered as (
  select
    (row_number() over (order by customer_id, etl_valid_from))::integer as customer_sk,
    customer_id,
    country_code,
    customer_state as customer_state_code,
    is_kyc,
    wants_newsletter,
    etl_valid_from,
    etl_valid_to,
    is_current as current_ind
  from src
)
select
  customer_sk,
  customer_id,
  country_code,
  customer_state_code,
  is_kyc,
  wants_newsletter,
  etl_valid_from,
  etl_valid_to,
  current_ind
from numbered
