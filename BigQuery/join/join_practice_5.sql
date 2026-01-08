-- 5. Incheon 출신 트레이너들은 1세대, 2세대 포켓몬을 각각 얼마나 보유하고 있나요?

# 쿼리를 작성하는 목표, 확인할 지표: 인천 출신 트레이너가 보유한 1세대, 2세대 포켓몬 수
# 쿼리 계산 방법: JOIN / 조건 -> 집계
# 데이터의 기간: -
# 사용할 테이블: pokemon, trainer, trainer_pokemon
# JOIN KEY: pokemon_id, trainer_id, id
# 데이터 특징: 보유의 정의

SELECT
    p.generation
  , COUNT(*) AS cnt
FROM (
      SELECT
          pokemon_id
        , trainer_id
      FROM `basic.trainer_pokemon`
      WHERE
          status IN ('Active', 'Training')
      ) AS tp
JOIN (
      SELECT
          id
      FROM `basic.trainer`
      WHERE
          hometown = 'Incheon'
      ) AS t
  ON tp.trainer_id = t.id
JOIN `basic.pokemon` AS p
  ON tp.pokemon_id = p.id
GROUP BY
    p.generation
ORDER BY
    p.generation;
