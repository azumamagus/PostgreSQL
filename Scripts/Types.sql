--List Types
SELECT      n.nspname as schema, t.typname as type ,*
FROM        pg_type t 
LEFT JOIN   pg_catalog.pg_namespace n ON n.oid = t.typnamespace 
WHERE       (t.typrelid = 0 OR (SELECT c.relkind = 'c' FROM pg_catalog.pg_class c WHERE c.oid = t.typrelid)) 
AND     NOT EXISTS(SELECT 1 FROM pg_catalog.pg_type el WHERE el.oid = t.typelem AND el.typarray = t.oid)
AND     n.nspname NOT IN ('pg_catalog', 'information_schema')

SELECT pg_type.typname AS enumtype, 
     pg_enum.enumlabel AS enumlabel
 FROM pg_type 
 JOIN pg_enum 
     ON pg_enum.enumtypid = pg_type.oid;
