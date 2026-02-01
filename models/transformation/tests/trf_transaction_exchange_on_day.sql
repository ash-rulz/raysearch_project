select t.transaction_date, t.currency
from {{ ref('stg_transaction') }} t
left join {{ ref('trf_currency_exchange') }} x
  on x.currency_code = t.currency
 and t.transaction_date = x.rate_date
where x.currency_code is null