-- 1. 각 트레이너별로 가진 포켓몬의 평균 레벨을 계산하고, 그 중 평균 레벨이 높은 TOP 3 트레이너의 이름과 보유한 포켓몬의 수, 평균 레벨을 출력해주세요

# 쿼리를 작성하는 목표, 확인할 지표: 트레이너의 이름, 보유한 포켓몬의 수, 평균 레벨
# 쿼리 계산 방법: 트레이너별 평균 레벨, 보유 포켓몬 수 계산한 결과(CTE) -> 트레이너 이름 JOIN
# 데이터의 기간: -
# 사용할 테이블: trainer_pokemon, trainer
# JOIN KEY: id, trainer_id
# 데이터 특징: status IN ('Active', 'Training')

WITH top3_trainer AS (
  SELECT
      trainer_id
    , ROUND(AVG(level), 2) AS avg_level
    , COUNT(*) AS pokemon_cnt
  FROM `basic.trainer_pokemon`
  WHERE
      status IN ('Active', 'Training')
  GROUP BY
      trainer_id
  ORDER BY
      avg_level DESC
  LIMIT 3
)

SELECT
    t.name
  , tt.avg_level
  , pokemon_cnt
FROM `top3_trainer` AS tt
JOIN `basic.trainer` AS t
ON tt.trainer_id = t.id;
