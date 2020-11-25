# 유저 생성 및 권한 부여

```
alter user myuser with password 'password';
create database mydb;
create user myuser with password 'password';
grant all privileges on database mydb to myuser;
```

# 완전 삭제

```
rm -rf /usr/local/var/postgres && initdb /usr/local/var/postgres -E utf8
```

# 실행

```
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
```

# 세션 찾기

```
select * from pg_stat_activity where datname='name';
```

# pid로 세션 제거

```
select pg_terminate_backend(pid);
```

# postgres dump 및 복구

```
pg_dump -h localhost -p 5432 -U postgres -Fc -Z 9 -b -C backup
pg_restore -v -h localhost -U postgres -p 8080 -C -d backup -F c /backup-20200528.cdmp
```

# pk 안 걸린 테이블 조회

```
select
table_name
from information_schema."tables"
where table_name not in ( select table_name from information_schema.table_constraints
where constraint_type = 'PRIMARY KEY'
)
and table_type = 'BASE TABLE'
and table_schema = 'public'
order by table_name;

select
 'do $$ declare v_name varchar; begin '|| chr(10) || array_to_string(array_agg(' select '''|| b.table_name ||''' into v_name where exists ( select '||b.col_names||', count(*) from "' || table_name || '" group by ' || b.col_names || ' having count(*) > 1); if v_name is not null then raise notice ''%'', v_name; end if;'), chr(10)) || 'end $$;'
from
(
	select
	table_name
	, column_count
	, (select array_to_string(array_agg(x.c), ',') from (select generate_series(1, a.column_count) as c ) as x) as col_numbers
	, (select array_to_string(array_agg('"'||column_name||'"'), ',') from information_schema."columns" where table_name = a.table_name) as col_names
	from
	(
		select
		t.table_name
		, (select count(*) from information_schema."columns" c where c.table_name = t.table_name) as column_count
		from information_schema."tables" t
		where t.table_name not in ( select table_name from information_schema.table_constraints
		where constraint_type = 'PRIMARY KEY'
		)
		and table_type = 'BASE TABLE'
		and t.table_schema = 'public'
		order by t.table_name
	) a
) b;
```

# mysql 기본 명령어

```
mysql -u username -p databasename
mysql -u root [-p password]
status
explain databases
ALTER USER 'id'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password' //접속시 caching_sha2_password 날 때
```

# etc

```
explain sql
select * from table for update
union minus intersect
```
