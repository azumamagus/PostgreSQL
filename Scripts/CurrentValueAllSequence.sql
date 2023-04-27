 CREATE OR REPLACE FUNCTION get_sequences()
      RETURNS TABLE (
        last_value bigint,
        sequence_schema text,
        sequence_name text
      )
      LANGUAGE plpgsql AS
    $func$
    DECLARE
        s RECORD;
    BEGIN
        FOR s IN SELECT t.sequence_schema, t.sequence_name
               FROM information_schema.sequences t
        LOOP
          RETURN QUERY EXECUTE format(
              'SELECT last_value, ''%1$s''::text, ''%2$s''::text FROM %1$I.%2$I',
              s.sequence_schema,
              s.sequence_name
          );
        END LOOP;
    END;
    $func$;

    SELECT * FROM get_sequences();

-- Postgres >= 12

select schemaname as schema, 
       sequencename as sequence, 
       last_value
from pg_sequences;


SELECT nspname as schema, 
       relname AS sequence_name,
       coalesce(pg_sequence_last_value(s.oid), 0) AS seq_last_value
FROM pg_class AS s
   JOIN pg_depend AS d ON d.objid = s.oid
   JOIN pg_attribute a ON d.refobjid = a.attrelid
                          AND d.refobjsubid = a.attnum
   JOIN pg_namespace nsp ON s.relnamespace = nsp.oid
WHERE s.relkind = 'S'
  AND d.refclassid = 'pg_class'::regclass
  AND d.classid = 'pg_class'::regclass
  AND nspname NOT IN ('topology', 'tiger')
ORDER BY 1,2 DESC;

