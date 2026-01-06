-- 5. 트레이너가 포켓몬을 처음으로 포획한 날짜와 마지막으로 포획한 날짜의 간격이 큰 순으로 정렬하는 쿼리

# 쿼리를 작성하는 목표, 확인할 지표: 포켓몬 포획 최소/최대 날짜
# 쿼리 계산 방법: MIN, MAX, DATE_DIFF
# 데이터의 기간: -
# 사용할 테이블: trainer_pokemon
# JOIN KEY: -
# 데이터 특징:
  -- catch_date: DATE 타입 --> UTC 기준
  -- catch_datetime: TIMESTAMP 타입 --> UTC 기준
  -- 'Asia/Seoul'로 타임존 설정 필요

SELECT
    trainer_id
  , MIN(DATETIME(catch_datetime, 'Asia/Seoul')) AS min_date
  , MAX(DATETIME(catch_datetime, 'Asia/Seoul')) AS max_date
  , DATETIME_DIFF(
          MAX(DATETIME(catch_datetime, 'Asia/Seoul'))
        , MIN(DATETIME(catch_datetime, 'Asia/Seoul'))
        , DAY
    ) AS diff_date
FROM `basic.trainer_pokemon`
GROUP BY
    trainer_id
ORDER BY
    diff_date DESC;
