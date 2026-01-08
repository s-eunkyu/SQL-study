-- 6. 각 포켓몬의 최고 레벨과 최저 레벨을 계산하고, 레벨 차이가 가장 큰 포켓몬의 이름을 출력하세요

# 쿼리를 작성하는 목표, 확인할 지표: 포켓몬 이름, 최고 레벨, 최저 레벨
# 쿼리 계산 방법: trainer_pokemon에서 포켓몬의 최고 레벨, 최저 레벨을 계산 -> 차이를 구하고 -> 차이가 큰 순으로 정렬
# 데이터의 기간: -
# 사용할 테이블: trainer_pokemon, pokemon
# JOIN KEY: pokemon_id, id
# 데이터 특징: -

WITH min_max AS (
    SELECT
        pokemon_id
      , MAX(level) AS max_level
      , MIN(level) AS min_level
      , MAX(level) - MIN(level) AS level_diff
    FROM `basic.trainer_pokemon`
    GROUP BY
        pokemon_id
    ORDER BY
        level_diff DESC
    LIMIT 1
)
  
SELECT
    mm.pokemon_id
  , p.kor_name
  , mm.level_diff
FROM `min_max` AS mm
JOIN `basic.pokemon` AS p
ON mm.pokemon_id = p.id;
