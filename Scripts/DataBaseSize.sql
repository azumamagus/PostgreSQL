--Para saber o tamanho do banco:
SELECT pg_size_pretty(pg_database_size('nome_do_banco'));

--Para saber o tamanho de um índice:
SELECT pg_size_pretty(pg_relation_size('nome_do_indice'));

--Para saber o tamanho de uma tabela, sem índices:
SELECT pg_size_prettY(pg_relation_size('nome_da_tabela'));

--Para saber o tamanho de uma tabela incluindo os índices:
SELECT pg_size_pretty(pg_total_relation_size('nome_da_tabela'));