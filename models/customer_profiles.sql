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
        date_trunc('month', consumed_at) as month,
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
left join consumption c on sc.customer_id = c.customer_id

-- remove ;
