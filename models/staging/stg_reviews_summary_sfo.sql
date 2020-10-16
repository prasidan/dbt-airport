with source  as (
    select * from {{'reviews_summary_sfo'}}
),

renamed as (
    select 
        to_date(date, 'YYYY-MM-DD') as date_day
        ,listing_id

    from source
    --group by date_day
)

select * from renamed