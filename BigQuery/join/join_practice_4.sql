-- 4. Master 등급인 트레이너들은 어떤 타입의 포켓몬을 제일 많이 보유하고 있을까요?

# 쿼리를 작성하는 목표, 확인할 지표: Master 트레이너가 가장 많이 가진 포켓몬 타입
# 쿼리 계산 방법: Master 트레이너 추출 -> 3개 JOIN -> 집계 함수
# 데이터의 기간: -
# 사용할 테이블: trainer, trainer_pokemon, pokemon
# JOIN KEY: trainer_id, id / id, pokemon_id
# 데이터 특징:
  -- 보유하다: status가 Active / Training

SELECT
    p.type1
  , COUNT(*) AS cnt
FROM (
      SELECT
          id
      FROM `basic.trainer`
      WHERE
          achievement_level = 'Master'
     ) AS m
JOIN (
      SELECT
          trainer_id
        , pokemon_id
      FROM `basic.trainer_pokemon`
      WHERE
          status IN ('Active', 'Training')
      ) AS tp
  ON m.id = tp.trainer_id
JOIN `basic.pokemon` AS p
  ON tp.pokemon_id = p.id
GROUP BY
  p.type1
ORDER BY
  COUNT(p.type1) DESC
LIMIT 1;
