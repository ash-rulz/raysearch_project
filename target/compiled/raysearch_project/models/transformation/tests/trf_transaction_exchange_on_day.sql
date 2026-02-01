select t.transaction_date, t.currency
from "warehouse"."main_stg"."stg_transaction" t
left join "warehouse"."main_trf"."trf_currency_exchange" x
  on x.currency_code = t.currency
 and t.transaction_date = x.rate_date
where x.currency_code is null