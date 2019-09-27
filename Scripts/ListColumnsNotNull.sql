SELECT DISTINCT 
  table_name, 
  column_name 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE 
  column_name IS NOT NULL 
  AND data_type ilike '%chara%'
  AND table_schema in ('public','posto','movimentacoes')
ORDER BY 1,2
