-- verifica o ctid das linhas
select (ctid::text::point)[0]::int, ctid, * from [tabela]
