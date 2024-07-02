with source as (

    -- Pull from source from the db. Different if we were using seeds. 

    select * from {{ source('aether_energy_analytics', 'customers') }}
),

renamed as (

    select
        customer_id,
        customer_name, --as namer,
        age,
        region
        -- note we are not including gender, just to make it interesting

    from source

)