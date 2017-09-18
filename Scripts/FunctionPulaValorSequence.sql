


CREATE OR REPLACE FUNCTION peixinho() RETURNS void AS $p$
declare
	curSelect refcursor;
	sSequence varchar;
	
begin
	OPEN curSelect SCROLL FOR SELECT c.relname, c.relnamespace FROM pg_class c WHERE c.relkind = 'S';
	LOOP 
		fetch curSelect into sSequence;
		EXIT WHEN NOT FOUND;
		EXECUTE 'SELECT setval(''"' || sSequence || '"'', nextval(''"' || sSequence || '"'')+10000)';
	END LOOP;
	close curSelect;
	
end
$p$
language 'plpgsql'

SELECT peixinho();



--Ou usar esse comando
select 'alter sequence ' || nspname || '.' || relname || ' restart with ' || nextval(nspname || '.' || relname) + 10000 || ';' 
from pg_class join pg_namespace on pg_class.relnamespace = pg_namespace.oid where relkind = 'S'