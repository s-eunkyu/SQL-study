-- 2. 배틀이 일어난 시간(battle_datetime)을 기준으로, 오전 6시에서 오후 6시 사이에 일어난 배틀의 수를 계산해주세요

# 쿼리를 작성하는 목표, 확인할 지표: 배틀의 수
# 쿼리 계산 방법: COUNT
# 데이터의 기간: 06~18시
# 사용할 테이블: battle
# JOIN KEY: - 
# 데이터 특징:
  -- battle_date: DATE 타입
  -- battle_datetime: DATETIME 타입 --> 'Asia/Seoul' 기준
  -- battle_timestamp: TIMESTAMP 타입 --> UTC 기준

-- (1) 데이터 검증을 위한 쿼리
SELECT
  id,
  battle_datetime,
  DATETIME(battle_timestamp, 'Asia/Seoul') AS battle_datetime_kr
FROM `basic.battle`
WHERE
  battle_datetime != DATETIME(battle_timestamp, 'Asia/Seoul');
-- 출력: NULL

-- (2) 배틀의 수 추출
SELECT
  COUNT(DISTINCT id) AS cnt
FROM `basic.battle`
WHERE EXTRACT(HOUR FROM battle_datetime) >= 6
  AND EXTRACT(HOUR FROM battle_datetime) < 18;
