-- 5. 트레이너가 잡았던 포켓몬의 총 공격력(attack)과 방어력(defense)의 합을 계산하고, 이 합이 가장 높은 트레이너를 찾으세요

# 쿼리를 작성하는 목표, 확인할 지표: 트레이너 id, 공격력 합, 방어력 합
# 쿼리 계산 방법: trainer_pokemon + pokemon 공격력/방어력 합 -> trainer name
# 데이터의 기간: -
# 사용할 테이블: trainer_pokemon, pokemon, trainer
# JOIN KEY: trainer_id, pokemon_id, id, id
# 데이터 특징: -

WITH attack_defense AS (
    SELECT
        tp.trainer_id
      , SUM(p.attack) AS total_attack
      , SUM(p.defense) AS total_defense
      , SUM(p.attack + p.defense) AS total
    FROM `basic.trainer_pokemon` AS tp
    JOIN `basic.pokemon` AS p
    ON tp.pokemon_id = p.id
    GROUP BY
        tp.trainer_id
    ORDER BY
        total DESC
    LIMIT 1
)

SELECT
    ad.trainer_id
  , t.name
  , ad.total_attack
  , ad.total_defense
  , ad.total
FROM `attack_defense` AS ad
JOIN `basic.trainer` AS t
ON ad.trainer_id = t.id;
