-- 3. 전설의 포켓몬을 보유한 트레이너들은 전설의 포켓몬과 일반 포켓몬을 얼마나 보유하고 있을까요? (트레이너의 이름을 같이 출력해주세요)

# 쿼리를 작성하는 목표, 확인할 지표: 트레이너 이름, 전설 포켓몬 수, 일반 포켓몬 수
# 쿼리 계산 방법: trainer_pokemon + pokemon is_legendary -> COUNT -> trainer name
# 데이터의 기간: -
# 사용할 테이블: trainer_pokemon, trainer, pokemon
# JOIN KEY: trainer_id, pokemon_id, id
# 데이터 특징: 보유하다는 status != 'Released'

WITH not_released_pokemon AS (
    SELECT
        id
      , pokemon_id
      , trainer_id
    FROM `basic.trainer_pokemon`
    WHERE
        status != 'Released'
), trainer_legend AS (
    SELECT
        nrp.trainer_id
      , SUM(
            CASE WHEN p.is_legendary = TRUE THEN 1 ELSE 0 END
        ) AS legend
      , SUM(
            CASE WHEN p.is_legendary = FALSE THEN 1 ELSE 0 END
        ) AS normal
    FROM `not_released_pokemon` AS nrp
    LEFT JOIN `basic.pokemon` AS p
    ON nrp.pokemon_id = p.id
    GROUP BY
        nrp.trainer_id
)

SELECT
    t.name
  , tl.legend
  , tl.normal
FROM `trainer_legend` AS tl
JOIN `basic.trainer` AS t
ON tl.trainer_id = t.id
WHERE
    tl.legend >= 1;
