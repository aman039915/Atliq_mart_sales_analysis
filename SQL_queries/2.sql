SELECT 	city, count(store_id) as Total_stores
FROM dim_stores
GROUP BY city
order by Total_stores desc