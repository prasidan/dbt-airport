--two columns, month and deplaned passengers
with deplaned as(
    select * from {{ref('stg_airport_sfo')}}
),

passengers as (
    select 
        date_month
        --,category1
        ,sum(passengers) as passengers_sfo
    from deplaned
    group by date_month, category1
    having category1 = 'visitors'
    order by category1, date_month

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