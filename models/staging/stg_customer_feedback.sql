with source as (

    -- Pull from source from the db. Different if we were using seeds. 

    select * from {{ source('aether_energy_analytics','customer_feedback')}}

),

renamed as (

    select
        feedback_date, --as timerstamp
        customer_id,
        rating
        -- note we are not including gender, just to make it interesting

    from source

)