{{
    config(
        materialized='view',
        tags=['dim','cleansed']
    )
}}
with src_hosts as
(
    select
        *
    from
        {{ ref('src_hosts') }}
)
select
    host_id,
    nvl(host_name,'Anonmyous') as host_name,
    is_superhost,
    created_at,
    updated_at
from
    src_hosts