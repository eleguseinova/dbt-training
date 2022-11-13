select
    CUSTOMERID,
    PRODUCTNAME,
    CATEGORY,
    SUBCATEGORY,
    sum(orderprofit) as profit
from {{ ref('stg_orders') }}
group by
    CUSTOMERID,
    PRODUCTNAME,
    CATEGORY,
    SUBCATEGORY