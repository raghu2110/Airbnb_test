{% test minimum_row_count(model, minimum_count) %}
    select count(*) as row_count
    from {{ model }}
    having count(*) < {{ minimum_count }}
{% endtest %}