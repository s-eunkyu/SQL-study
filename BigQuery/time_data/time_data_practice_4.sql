-- 4. 배틀이 일어난 날짜(battle_date)를 기준으로, 요일별로 배틀이 얼마나 자주 일어났는지 계산해주세요

# 쿼리를 작성하는 목표, 확인할 지표: 요일별 배틀 수
# 쿼리 계산 방법: COUNT, FORMAT_DATE or EXTRACT
# 데이터의 기간: -
# 사용할 테이블: battle
# JOIN KEY: -
# 데이터 특징:
  -- battle_date: DATE 타입 --> Asia/Seoul
  -- battle_datetime: DATETIME 타입 --> Asia/Seoul
  -- battle_timestamp: TIMESTAMP 타입 --> UTC

SELECT
    CASE WHEN wd = 1 THEN 'Sun'
         WHEN wd = 2 THEN 'Mon'
         WHEN wd = 3 THEN 'Tue'
         WHEN wd = 4 THEN 'Wen'
         WHEN wd = 5 THEN 'Thu'
         WHEN wd = 6 THEN 'Fri'
         WHEN wd = 7 THEN 'Sat'
    END AS weekday
  , cnt
FROM (SELECT
          EXTRACT(DAYOFWEEK FROM battle_datetime) AS wd
        , COUNT(*) AS cnt
      FROM `basic.battle`
      GROUP BY
          EXTRACT(DAYOFWEEK FROM battle_datetime))
ORDER BY
    wd;
