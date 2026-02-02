-- Fails if any row has both deposit and withdrawal equal to 0
with t as (
    select * from {{ ref('trf_transaction') }}
)
select *
from t
where coalesce(withdrawal, 0) = 0
  and coalesce(deposit, 0) = 0
