-- 5. 트레이너가 포켓몬을 포획한 날짜(catch_date)가 '2023-01-01' 이후이면 'Recent', 그렇지 않으면 'Old'로 분류해주세요

# 쿼리를 작성하는 목표, 확인할 지표: 포획 날짜별 분류 지표
# 쿼리 계산 방법: CASE-WHEN
# 데이터의 기간: -
# 사용할 테이블: trainer_pokemon
# JOIN KEY: -
# 데이터 특징:
  -- catch_date: DATE 타입 --> UTC 기준
  -- catch_datetime: TIMESTAMP 타입 --> UTC 기준
  -- 'Asia/Seoul'로 타임존 설정 필요

SELECT
    id
  , trainer_id
  , pokemon_id
  , DATETIME(catch_datetime, 'Asia/Seoul') AS datetime_kr
  , CASE WHEN DATETIME(catch_datetime, 'Asia/Seoul') >= '2023-01-01' THEN 'Recent'
         ELSE 'Old'
    END AS recent_old
FROM `basic.trainer_pokemon`;
