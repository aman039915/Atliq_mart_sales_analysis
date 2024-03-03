SELECT distinct product_name
FROM dim_products d
LEFT JOIN fact_events f 
on d.product_code=f.product_code
WHERE promo_type='BOGOF' and base_price>500