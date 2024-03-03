create view discounted_price as
select *,
case
        when promo_type="50% OFF" then base_price*0.5
        when promo_type="25% OFF" then base_price*0.75
		when promo_type="33% OFF" then base_price*0.67
        when promo_type="BOGOF" then base_price*0.5
        when promo_type="500 Cashback" then base_price-500
        end as discount_price 
 from fact_events;
select campaign_name,
concat(round(sum(base_price*`quantity_sold(before_promo)`)/1000000)," M") as total_revenue_before_promotion,
concat(round(Sum(discount_price*`quantity_sold(after_promo)`)/1000000)," M") as total_revenue_after_promotion
from discounted_price
join dim_campaigns
using (campaign_id)
group by campaign_name;
