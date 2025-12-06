with src_listings as
(
    select
        *
    from
        {{ ref('dim_listings_cleansed') }}
),
src_hosts as
(
    select
        *
    from
        {{ ref('dim_hosts_cleansed') }}
)
select
    l.listing_id,
    l.listing_name,
    l.listing_url,
    l.room_type,
    l.minimum_nights,
    l.price,
    h.host_id,
    h.host_name,
    h.is_superhost as host_is_superhost,
    l.created_at,
    greatest(l.updated_at, h.updated_at) as updated_at
from
    src_listings l      
join src_hosts h
    on l.host_id = h.host_id