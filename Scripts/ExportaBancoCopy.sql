/*
	EXPORTA BANCO DE DADOS EM BINÁRIO PARA POSSIVEL IMPORTAÇÃO
*/

CREATE OR REPLACE FUNCTION public.extraibanco()
  RETURNS void AS
$BODY$
DECLARE
	curSelect refcursor;
	tabela varchar;
BEGIN
	OPEN curSelect SCROLL FOR select tablename from pg_tables where schemaname = 'public' order by 1;
	loop 
		fetch curSelect into tabela;
		EXIT WHEN NOT FOUND;
		--execute 'COPY  '|| quote_ident(tabela) ||' TO ''/teste/bancos''';
		execute 'COPY BINARY '|| quote_ident(tabela) ||' TO ''/teste/' || tabela || '''';				
	end loop;	
END;
$BODY$
  LANGUAGE plpgsql VOLATILE


select extraibanco();