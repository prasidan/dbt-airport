with source  as (
    select * from {{'wiki_aus'}}
),

renamed as (
    select 
        substring(source.timestamp,1,8) as date_month
        ,views::float as views_wiki_aus

    from source
),

final as (
    select 
       to_date(renamed.date_month, 'YYYYMMDD') as date_month
       ,views_wiki_aus
    from renamed
)

select * from final