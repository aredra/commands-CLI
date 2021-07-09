# 유저 생성 및 권한 부여

```sql
alter user myuser with password 'password';
create database mydb;
create user myuser with password 'password';
grant all privileges on database mydb to myuser;
```

# 완전 삭제

```sh
rm -rf /usr/local/var/postgres && initdb /usr/local/var/postgres -E utf8
```

# 실행

```sh
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
```

# 세션 찾기

```sql
select * from pg_stat_activity where datname='name';
```

# pg_hba reload

```sql
select pg_reload_conf();
```

# pid로 세션 제거

```sql
select pg_terminate_backend(pid);
```

# postgres dump 및 복구

```
pg_dump -h localhost -p 5432 -U postgres -Fc -Z 9 -b -C backup
pg_restore -v -h localhost -U postgres -p 8080 -C -d backup -F c /backup-20200528.cdmp
```

# pk 안 걸린 테이블 조회

```sql
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
mysql.server start // mac mysql 서버 시작
mysql -u username -p databasename
mysql -u root [-p password]
status
explain databases
ALTER USER 'id'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password' //접속시 caching_sha2_password 날 때
```

# etc

```sql
explain sql
select * from table for update
union minus intersect
```

# array & json & string

```sql
with tmp as (
  select
    col1
    , array_agg(col1) as col2
  from
    test_table
)

select
  array_to_string(col2, ', ') as col_string
from
  tmp

select
  string_to_array(col2, ', ') as col_string
from
  tmp

select row_to_json(tmp) from tmp;
select row_to_json(row(col1, col2)) from tmp;

select
  col1
  , array_agg(col2) as col_agg
from
  test_table
group by
  1

select
  col1
  , string_agg(col1::text, ', ') as col_agg
from
  test_table
group by
  1
```

# select 기반 Insert, Update

```sql
-- select를 활용한 insert, update

INSERT INTO test_a
( uid, title, note, props, valid_ts, created_ts, created_uid, updated_ts, updated_uid )
SELECT uid, title, note, props, valid_ts, created_ts, created_uid, updated_ts, updated_uid
FROM test_b
WHERE title = 'test1'

UPDATE test_a
   SET (props) = (SELECT props FROM test_b WHERE uid = test_a.uid AND props IS NOT NULL);

UPDATE test_a
   SET (title, note) = (SELECT title, note FROM test_b WHERE uid = test_a.uid);
```

# postgresql 시간값 다루기

```sql
select current_timestamp; -- 현재 타임스탬프

select now();             -- 위와 동일

select current_date;      -- 현재 날짜

select current_time;      -- 현재 시간

-- 현재 시간값에서 1일 빼기 
select current_timestamp - interval '1 day';

-- 현재 시간값에서 1달 더하기
select current_timestamp + interval '1 month';

-- 시간값 끼리 계산
select now() - (now() - interval '10 year');    

-- 현재 시간값에서 'YYYY-MM-DD' 포맷으로 변환
select to_char(now(), 'YYYY-MM-DD');            

-- 해당 포맷의 문자열을 시간값으로 변환
select to_timestamp('20210619', 'YYYYMMDD')

-- 현재 시간값에서 day 값만 추출
select extract(day from now());

-- 현재 시간값에서 month 값만 추출
select extract(month from now());

-- 날짜 미만 시간값 버림
select date_trunc('day', now());
```

## padding 추가

```sql
-- lpad, rpad 가 있고 사용은 아래와 같다.
-- lpad or rpad(텍스트, 자릿수, 채울 문자)

select lpad(t.hour, 2, '0') from test_table t
select rpad(t.hour, 2, '0') from test_table t
```