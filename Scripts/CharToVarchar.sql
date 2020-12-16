--Select que lista as colunas do tipo CHAR
SELECT n.nspname, c.relname, a.attname, a.attnum, atttypmod
FROM
    pg_type t
    JOIN pg_attribute a ON a.atttypid = t.oid
    JOIN pg_class c ON c.oid = a.attrelid
    JOIN pg_namespace n ON n.oid = c.relnamespace
WHERE
    t.typname = 'bpchar' AND
    n.nspname NOT IN ('pg_catalog', 'pg_toast', 'information_schema')
ORDER BY 1,2,3
;

-- Select que monta o alter table alterando a coluna do tipo char para varchar
SELECT 'ALTER TABLE ' || n.nspname || '.' || c.relname || string_agg ($$ ALTER $$ || a.attname || $$ TYPE varchar($$ || a.attnum || $$)$$,',') || ';'
FROM
    pg_type t
    JOIN pg_attribute a ON a.atttypid = t.oid
    JOIN pg_class c ON c.oid = a.attrelid
    JOIN pg_namespace n ON n.oid = c.relnamespace
WHERE
    t.typname = 'bpchar' AND
    a.attnum > 1 AND
    n.nspname NOT IN ('pg_catalog', 'pg_toast', 'information_schema')
GROUP BY n.nspname, c.relname
ORDER BY n.nspname, c.relname
;


