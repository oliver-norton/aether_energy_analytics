-- Monthly energy consumption data per customer

with consumption as (
    select
        customer_id,
        date_trunc('month', timestamp) as month,
        sum(energy_usage_kWh) as total_energy_usage
    from {{ ref('stg_energy_consumption') }}
    group by customer_id, month
)

select
    c.month,
    c.customer_id,
    c.total_energy_usage
from consumption c
join {{ ref('stg_customers') }} sc on c.customer_id = sc.customer_id

-- removed ; 



-- with consumption as (
--     select * from {{ ref('stg_energy_consumption') }}
-- )
-- , monthly_consumption as (
--     select
--         date_trunc('month', timestamp) as month,
--         customer_id,
--         sum(energy_usage_kWh) as total_energy_usage
--     from consumption
--     group by 1, 2
-- )

-- select * from monthly_consumption;