-- Aggregated customer feedback data including average rating and feedback count per customer

with customer_feedback as (
    select
        customer_id,
        avg(rating) as avg_rating,
        count(*) as feedback_count
    from {{ ref('stg_customer_feedback') }}
    group by customer_id
)

select
    cf.customer_id,
    cf.avg_rating,
    cf.feedback_count
from customer_feedback cf
join {{ ref('stg_customers') }} sc on cf.customer_id = sc.customer_id

-- ; removed










-- with feedback as (
--     select * from {{ ref('stg_customer_feedback') }}
-- )
-- , aggregated_feedback as (
--     select
--         customer_id,
--         avg(rating) as avg_rating,
--         count(*) as feedback_count
--     from feedback
--     group by customer_id
-- )
-- select * from aggregated_feedback;