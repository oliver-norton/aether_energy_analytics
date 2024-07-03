-- Comprehensive customer profile including demographics, feedback, and energy consumption data

with customer_feedback as (
    select
        customer_id,
        avg(rating) as avg_rating,
        count(*) as feedback_count
    from {{ ref('stg_customer_feedback') }}
    group by customer_id
),

consumption as (
    select
        customer_id,
        date_trunc('month', timestamp) as month,
        sum(energy_usage_kWh) as total_energy_usage
    from {{ ref('stg_energy_consumption') }}
    group by customer_id, month
)

select
    sc.customer_id,
    sc.customer_name,
    sc.age,
    sc.region,
    cf.avg_rating,
    cf.feedback_count,
    c.total_energy_usage
from {{ ref('stg_customers') }} sc
left join customer_feedback cf on sc.customer_id = cf.customer_id
left join consumption c on sc.customer_id = c.customer_id;










-- with customers as (
--     select * from {{ ref('stg_customers') }}
-- )
-- , feedback as (
--     select * from {{ ref('aggregated_feedback') }}
-- )
-- , consumption as (
--     select * from {{ ref('monthly_consumption') }}
-- )
-- , customer_profiles as (
--     select
--         c.customer_id,
--         c.customer_name,
--         c.age,
--         -- c.gender,
--         c.region,
--         f.avg_rating,
--         f.feedback_count,
--         sum(co.total_energy_usage) as total_energy_usage
--     from customers c
--     left join feedback f on c.customer_id = f.customer_id
--     left join consumption co on c.customer_id = co.customer_id
--     group by c.customer_id, c.customer_name, c.age, c.region, f.avg_rating, f.feedback_count -- c.gender,
-- )
-- select * from customer_profiles;