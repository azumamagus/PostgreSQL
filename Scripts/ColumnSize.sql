select
    pg_size_pretty(sum(pg_column_size(column_name))) as total_size,
    pg_size_pretty(avg(pg_column_size(column_name))) as average_size,
    sum(pg_column_size(column_name)) * 100.0 / pg_total_relation_size('table_name') as percentage
from table_name;
