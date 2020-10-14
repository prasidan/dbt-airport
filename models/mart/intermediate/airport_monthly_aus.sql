--two columns, month and deplaned passengers
with deplaned as(
    select * from {{ref('stg_airport_aus')}}
),

passengers as (
    select 
        date_trunc('month', date_day) as date_month
        ,domestic_deplaned_passengers
        --,intl_deplaned_passengers
        from deplaned
),

final as (
    select 
        *
    --add case when to add AUS column
    --this data is monthly, so it's just selecting month and deplaned totals
    from passengers
    --group by date_month
    order by date_month
)

select * from final