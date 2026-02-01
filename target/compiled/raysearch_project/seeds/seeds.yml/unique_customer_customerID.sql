
    
    

select
    customerID as unique_field,
    count(*) as n_records

from "warehouse"."main_raw"."customer"
where customerID is not null
group by customerID
having count(*) > 1


