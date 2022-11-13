select
    PRODUCTID,
    PRODUCTNAME,
    CATEGORY,
    SUBCATEGORY,
    sum(orderprofit) as profit
from {{ ref('stg_orders') }}
group by
    PRODUCTID,
    PRODUCTNAME,
    CATEGORY,
    SUBCATEGORY