-- 1. 트레이너가 보유한 포켓몬들은 얼마나 있는지 알 수 있는 쿼리를 작성해주세요
-- 결과 열: pokemon_name(STR), pokemon_cnt(INT)

# 쿼리를 작성하는 목표, 확인할 지표: 보유 중인 포켓몬 수와 그 이름
# 쿼리 계산 방법: trainer_pokemon + pokemon JOIN, GROUP BY 집계
# 데이터의 기간: -
# 사용할 테이블: trainer_pokemon, pokemon
# JOIN KEY: pokemon_id, id
# 데이터 특징:
  -- 보유하다: status가 Active 이거나 Training
  -- Released는 방출했다는 것을 의미

SELECT
    p.kor_name AS pokemon_name
  , tp.cnt AS pokemon_cnt
FROM (SELECT
          pokemon_id
        , COUNT(DISTINCT id) AS cnt
      FROM `basic.trainer_pokemon`
      WHERE
          status IN ('Active', 'Training')
      GROUP BY
          pokemon_id
      ) AS tp
INNER JOIN `basic.pokemon` AS p
ON tp.pokemon_id = p.id
ORDER BY
    tp.cnt DESC;
