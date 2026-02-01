select customer_id, etl_valid_from, count(*) as cnt
from "warehouse"."main_trf"."trf_customer_scd2"
group by customer_id, etl_valid_from
having count(*) > 1