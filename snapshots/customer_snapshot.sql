{% snapshot customer_snapshot %}
{{
  config(
    target_schema='main_trf',
    unique_key='customerID',
    strategy='timestamp',
    updated_at='latest_update_ts',
    invalidate_hard_deletes=True
  )
}}

select
  customerID as customerID,
  country as country,
  state as state,
  VIP as VIP,
  KYC as KYC,
  wantsNewsletter as wantsNewsletter,
  -- parse latestUpdate to a TIMESTAMP used by timestamp strategy
  try_strptime(cast(latestUpdate as varchar), '%m/%d/%Y') as latest_update_ts
from {{ ref('customer') }}

{% endsnapshot %}
