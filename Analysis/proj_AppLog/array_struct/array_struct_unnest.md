# Array
같은 타입의 여러 값을 하나의 컬럼에 저장할 수 있는 자료형

## Array 생성하기
1. 대괄호 [] 사용하기
```sql
SELECT [0, 1, 1, 2, 3, 5] AS some_numbers
UNION ALL
SELECT [2, 4, 8, 16, 32]
```
2. ARRAY<> 사용하기: ARRAY<자료형>
```sql
SELECT
  ARRAY<INT64>[0, 1, 3] AS some_numbers
```
3. 배열 생성 함수 사용 (GENERATE_ARRAY 등)
```sql
SELECT
    GENERATE_DATE_ARRAY('2024-01-01', '2024-02-01', INTERVAL 1 WEEK) AS output1
  , GENERATE_ARRAY(1, 5, 2) AS output2
```
4. ARRAY_AGG 함수 사용: 여러 결과를 마지막에 배열로 저장하고 싶은 경우 사용
```sql
WITH languages AS(
  SELECT "kor" AS language
  UNION ALL
  SELECT "eng"
  UNION ALL
  SELECT "jap"
)

SELECT ARRAY_AGG(language) AS output
FROM languages
```

## Array 데이터 접근
- OFFSET: 0부터 시작 (SAFE_OFFSET)
- ORDINAL: 1부터 시작 (SAFE_ORDINAL)
```sql
SELECT
  배열_컬럼[OFFSET/ORDINAL(숫자)]
```

---
<br/>

# Struct
서로 다른 타입의 여러 값을 하나의 컬럼에 저장할 수 있는 자료형

## Struct 생성하기
1. 소괄호 () 사용하기
```sql
SELECT
  (1, 2, 3) AS struct_test
```
2. STRUCT<>() 사용하기: STRUCT<자료형>(데이터)
```sql
SELECT
  STRUCT<hi INT64, hello INT64, good STRING>(1, 2, 'hi') AS struct_test
```

## Struct 데이터 접근
- STRUCT이름.key
```sql
SELECT
    struct_test.hi
  , struct_test.hello
FROM (
  SELECT
    STRUCT<hi INT64, hello INT64, good STRING>(1, 2, 'hi') AS struct_test
)
```

---
<br/>

# UNNEST
배열을 독립적인 행으로 풀어서(평면화) 사용

```sql
SELECT
    a.column
  , alias_name
FROM Table_A AS a
CROSS JOIN UNNEST(ARRAY_Column) AS alias_name
-- FROM Table_A AS a, UNNEST(ARRAY_Column) AS alias_name
```
