select t.transaction_date, t.customer_id
from "warehouse"."main_stg"."stg_transaction" t
left join "warehouse"."main_trf"."trf_customer_scd2" c
  on c.customer_id = t.customer_id
 and t.transaction_date between c.etl_valid_from and c.etl_valid_to
where c.customer_id is null