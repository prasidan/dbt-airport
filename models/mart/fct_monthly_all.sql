with aus as (
    select * from {{ref('fct_monthly_aus')}}
),

sfo as (
    select * from {{ref('fct_monthly_sfo')}}
),

final as (
    select 
        * 
    from aus
    left join sfo
    using(date_month)
    where date_month>= '2015-07-01'
    and date_month <= '2020-01-01'
    order by date_month
)

select *  from final