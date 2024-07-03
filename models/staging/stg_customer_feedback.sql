with source as (

    -- Pull from source from the db. Different if we were using seeds. 

    select * from {{ source('aether_energy_analytics', 'customer_feedback') }}

),

-- this could also be considered as 'cleaning' renaming columns, selecting only some columns etc. 
renamed as (

    select
        feedback_date--as timerstamp
        customer_id,
        rating
    from source

)

select * from renamed