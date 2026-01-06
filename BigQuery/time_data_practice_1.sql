-- 1. 트레이너가 포켓몬을 포획한 날짜(catch_date)를 기준으로 2023년 1월에 포획한 포켓몬의 수를 계산
# 쿼리를 작성하는 목표, 확인할 지표: 날짜별 포켓몬의 수
# 쿼리 계산 방법: COUNT
# 데이터의 기간: 2023년 1월
# 사용할 테이블: trainer_pokemon
# JOIN KEY: -
# 데이터 특징: 시간 데이터
  -- catch_date: DATE 타입
  -- catch_datetime: UTC, TIMESTAMP 타입 --> 컬럼의 이름은 datetime인데 TIMESTAMP 타입으로 저장되어 있음 
  -- catch_date -> KR 기준? UTC 기준?
  -- catch_date != DATE(DATETIME(catch_datetime, 'Asia/Seoul')) -> 있다면 catch_date는 사용하기 어려울 수 있음
  -- 데이터를 저장하는 부분에서 이슈가 발생하는 경우

-- (1) 데이터 검증을 위한 쿼리
SELECT *
FROM (SELECT
      id,
      catch_date,
      DATE(DATETIME(catch_datetime, 'Asia/Seoul')) AS catch_datetime_kr_date
    FROM `basic.trainer_pokemon`)
WHERE catch_date != catch_datetime_kr_date;
-- 컬럼의 설명을 꼭 확인하고 sql을 작성해야함

-- (2) 날짜별 포켓몬의 수
SELECT COUNT(DISTINCT *) AS cnt
FROM `basic.trainer_pokemon`
WHERE
  EXTRACT(YEAR FROM DATETIME(catch_datetime, 'Asia/Seoul')) = 2023
  AND EXTRACT(MONTH FROM DATETIME(catch_datetime, 'Asia/Seoul')) = 1;
