with source as (

    -- Pull from source from the db. Different if we were using seeds. 

    select * from {{ source('aether_energy_analytics','energy_consumption')}}

),

renamed as (

    select
        timestamp,
        customer_id
       energy_usage_kWh

    from source

)

select * from renamed