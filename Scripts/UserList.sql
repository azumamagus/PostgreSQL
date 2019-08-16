-- List User
SELECT u.usename AS "Role name",
  CASE WHEN u.usesuper AND u.usecreatedb THEN CAST('superuser, create
database' AS pg_catalog.text)
       WHEN u.usesuper THEN CAST('superuser' AS pg_catalog.text)
       WHEN u.usecreatedb THEN CAST('create database' AS
pg_catalog.text)
       ELSE CAST('' AS pg_catalog.text)
  END AS "Attributes"
FROM pg_catalog.pg_user u
ORDER BY 1;




-- List ROLE
SELECT rolname FROM pg_user
JOIN pg_auth_members ON (pg_user.usesysid=pg_auth_members.member)
JOIN pg_roles ON (pg_roles.oid=pg_auth_members.roleid)
WHERE
pg_user.usename='USERNAME';
