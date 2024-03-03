select category,
concat(round(((sum(`quantity_sold(after_promo)`)-sum(`quantity_sold(before_promo)`))/
sum(`quantity_sold(before_promo)`))*100, 2), " %") as "ISU%",
rank() over( order by round(((sum(`quantity_sold(after_promo)`)-sum(`quantity_sold(before_promo)`))/
sum(`quantity_sold(before_promo)`))*100) desc) as rank_order
from fact_events
join dim_products
using (product_code)
join dim_campaigns
using (campaign_id)
where campaign_name = "Diwali"
group by category;
