-- 2. 각 트레이너가 가진 포켓몬 중에서 'Grass' 타입의 포켓몬 수를 계산해주세요 (기준: type1)

# 쿼리를 작성하는 목표, 확인할 지표: 트레이너가 보유한 포켓몬 중에서 Grass 타입의 포켓몬 수
# 쿼리 계산 방법: 트레이너가 보유한 조건, Grass 타입 조건, JOIN, COUNT
# 데이터의 기간: -
# 사용할 테이블: trainer_pokemon, pokemon
  -- Main이 되는 것은 포켓몬의 수 -> trainer_pokemon이 기준
# JOIN KEY: pokemon_id, id
# 데이터 특징:
  -- 보유하다: status가 Active 이거나 Training
  -- Released는 방출했다는 것을 의미

SELECT
    p.type1 AS pokemon_type
  , COUNT(tp.id) AS pokemon_cnt
FROM (SELECT
          pokemon_id
        , id
      FROM `basic.trainer_pokemon`
      WHERE
          status IN ('Active', 'Training')
) AS tp
LEFT JOIN `basic.pokemon` AS p
ON tp.pokemon_id = p.id
WHERE
    p.type1 = 'Grass'
GROUP BY
    p.type1;
