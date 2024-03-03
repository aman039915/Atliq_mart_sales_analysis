select category,product_name,
round(((sum(discount_price*`quantity_sold(after_promo)`)-sum(base_price*`quantity_sold(before_promo)`))/
sum(base_price*`quantity_sold(before_promo)`))*100, 2) as IR_perc
from discounted_price
join dim_products
using (product_code)
group by product_name, category 
order by IR_perc desc
limit 5;
        