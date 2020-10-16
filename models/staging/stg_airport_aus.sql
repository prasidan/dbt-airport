--add AUS in a new column
--aggregate deplaned domestic passengers by month
with source  as (
    select * from {{'airport_aus'}}
),

renamed as (
    select 
        to_date(source.date_month, 'MM-DD-YY') as date_day
        ,source."Domestic Deplaned Passengers: Revenue"::float as domestic_deplaned_passengers_aus
        ,source."International Deplaned Passengers: Revenue"::float as intl_deplaned_passengers_aus

    from source
)

select * from renamed