select reviews.* from {{ ref("fct_reviews") }} as reviews
join {{ ref("dim_listings_cleansed") }} as listings
    on reviews.listing_id = listings.listing_id
where reviews.review_date < listings.created_at