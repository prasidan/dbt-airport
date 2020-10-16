
with source  as (
    select * from {{'airport_sfo'}}
),

renamed as (
    select 
        "Activity Period" as date_month
        ,"Activity Type Code" as segmentation
        ,"Passenger Count" as passengers


    from source
),

final as (
    select 
    to_date(date_month, 'YYYYMM') as date_month
    ,segmentation
    ,replace(passengers,',','')::numeric as passengers
    ,case when segmentation = 'Deplaned' then 'visitors'
        else 'traveling'
        end category1
from renamed
)

select * from final