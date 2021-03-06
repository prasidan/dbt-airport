--two columns, month and total reviews
with airbnb as (
    select * from {{ref('stg_reviews_summary_aus')}}
),

final as (
    select 
        date_trunc('month', date_day) as date_month
        ,count(listing_id)::float as reviews_monthly_aus
        --use case when to add AUS column
        --this data is daily, so aggregate by month
        --sum reviews by month from airbnb
    from airbnb
    group by date_month
    order by date_month
)

select * from final