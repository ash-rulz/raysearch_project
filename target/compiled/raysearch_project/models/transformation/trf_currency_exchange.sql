-- Single-currency daily exchange rates with dedup by date
with src as (
	select * from "warehouse"."main_stg"."stg_currency_exchange"
)
select rate_date, currency_code, base_rate_eur
from src