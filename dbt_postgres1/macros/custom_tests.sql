-- macros/custom_tests.sql

-- positive test

{% macro test_positive(model, column_name) %}
select
    {{ column_name }} as value,
    count(*) as n_records
from {{ model }}
where {{ column_name }} < 0
group by {{ column_name }}
having count(*) > 0
{% endmacro %}

-- between value


{% macro test_between(model, column_name, min_value, max_value) %}
select
    {{ column_name }} as value,
    count(*) as n_records
from {{ model }}
where {{ column_name }} < {{ min_value }} or {{ column_name }} > {{ max_value }}
group by {{ column_name }}
having count(*) > 0
{% endmacro %}
