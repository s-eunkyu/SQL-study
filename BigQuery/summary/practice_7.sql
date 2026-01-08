-- 7. 각 트레이너가 가진 포켓몬 중에서 공격력(attack)이 100 이상인 포켓몬과 100 미만인 포켓몬의 수를 각각 계산해주세요. 트레이너의 이름과 두 조건에 해당하는 포켓몬의 수를 출력해주세요

# 쿼리를 작성하는 목표, 확인할 지표: 트레이너 이름, 공격력 100 이상/미만 포켓몬 수
# 쿼리 계산 방법: CASE WHEN - SUM
# 데이터의 기간: -
# 사용할 테이블: trainer_pokemon, trainer, pokemon
# JOIN KEY: trainer_id, pokemon_id, id, id
# 데이터 특징: -

WITH selected_pokemon AS (
    SELECT
        id
      , CASE WHEN attack >= 100 THEN 1 ELSE 0 END AS upper_100
      , CASE WHEN attack < 100 THEN 1 ELSE 0 END AS lower_100
    FROM `basic.pokemon`
    WHERE
        attack < 100
        OR attack >= 100
), selected_trainer AS (
    SELECT
        tp.trainer_id
      , SUM(upper_100) AS sum_upper
      , SUM(lower_100) AS sum_lower
    FROM `selected_pokemon` AS sp
    JOIN `basic.trainer_pokemon` AS tp
    ON sp.id = tp.pokemon_id
    WHERE
        tp.status != 'Released'
    GROUP BY
        tp.trainer_id
)

SELECT
    t.name
  , st.sum_upper
  , st.sum_lower
FROM `selected_trainer` AS st
JOIN `basic.trainer` AS t
ON st.trainer_id = t.id;
