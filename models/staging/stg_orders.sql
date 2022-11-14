select 
{{ dbt_utils.surrogate_key(['o.ORDERID', 'c.CUSTOMERID', 'p.PRODUCTID']) }} as sk_orders,
o.ORDERID,
o.ORDERDATE,
o.SHIPDATE,
o.SHIPMODE,
o.ORDERSELLINGPRICE - o.ORDERCOSTPRICE as orderprofit,
o.ORDERCOSTPRICE,
o.ORDERSELLINGPRICE,
c.CUSTOMERNAME,
c.SEGMENT,
c.COUNTRY,
c.CUSTOMERID,
p.CATEGORY,
p.PRODUCTID,
p.PRODUCTNAME,
p.SUBCATEGORY,
d.delivery_team
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.CUSTOMERID = c.CUSTOMERID
left join {{ ref('raw_products') }} as p
on o.PRODUCTID = p.PRODUCTID
left join {{ ref('delivery_team') }} as d
on o.SHIPMODE = d.SHIPMODE