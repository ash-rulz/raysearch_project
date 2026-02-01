select t.transaction_date, t.customer_id
from {{ ref('stg_transaction') }} t
left join {{ ref('trf_customer_scd2') }} c
  on c.customer_id = t.customer_id
 and t.transaction_date between c.etl_valid_from and c.etl_valid_to
where c.customer_id is null
