select * from {{ ref("dim_listings_cleansed") }} as min_minimum_nights
where min_minimum_nights.minimum_nights < 1
limit 10