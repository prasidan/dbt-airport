with source  as (
    select * from {{'wiki_aus'}}
),

renamed as (
    select 
        substring(source.timestamp,1,8) as date_month
        ,views

    from source
),

final as (
    select 
       to_date(renamed.date_month, 'YYYYMMDD') as date_month
       ,views
    from renamed
)

select * from final