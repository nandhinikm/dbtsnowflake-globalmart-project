select 

--from raw orders
o.orderid,
o.orderdate,
o.shipmode,
o.shipdate,
---from raw customer
c.customername,
c.customerid,
c.segment,
c.country,
---from product
p.category,
p.productid,
p.productname,
p.subcategory,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordersellingprice,
o.ordercostprice
 from {{ ref('raw_order') }} as o

left join {{ ref('raw_customer') }} as c
on o.customerid=c.customerid
left join {{ ref('raw_product') }} as p
on o.productid=p.productid