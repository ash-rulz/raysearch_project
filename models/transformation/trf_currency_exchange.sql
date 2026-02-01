-- Single-currency daily exchange rates with dedup by date
with src as (
	select * from {{ ref('stg_currency_exchange') }}
)
select rate_date, currency_code, base_rate_eur
from src