with airbnb as (
    select * from {{ref('airbnb_monthly_aus')}}
),

airport as (
    select * from {{ref('airport_monthly_aus')}}
),

wiki as (
    select * from {{ref('stg_wiki_aus')}}
),

final as (
    select 
        * 
    from airbnb 
    left join airport
    using(date_month)
    left join wiki
    using(date_month)
    order by date_month
)

select *  from final