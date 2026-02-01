
      
  
    
    

    create  table
      "warehouse"."trf"."customer_snapshot"
  
    as (
      
    

    select *,
        md5(coalesce(cast(customerID as varchar ), '')
         || '|' || coalesce(cast(latest_update_ts as varchar ), '')
        ) as dbt_scd_id,
        latest_update_ts as dbt_updated_at,
        latest_update_ts as dbt_valid_from,
        
  
  coalesce(nullif(latest_update_ts, latest_update_ts), null)
  as dbt_valid_to
from (
        


select
  customerID as customerID,
  country as country,
  state as state,
  VIP as VIP,
  KYC as KYC,
  wantsNewsletter as wantsNewsletter,
  -- parse latestUpdate to a TIMESTAMP used by timestamp strategy
  try_strptime(cast(latestUpdate as varchar), '%m/%d/%Y') as latest_update_ts
from "warehouse"."main_raw"."customer"

    ) sbq



    );
  
  
  