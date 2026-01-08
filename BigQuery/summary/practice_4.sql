-- 4. 가장 승리가 많은 트레이너 ID, 트레이너의 이름, 승리한 횟수, 보유한 포켓몬의 수, 평균 포켓몬의 레벨을 출력해주세요. 단 포켓몬의 레벨은 소수점 2째 자리에서 반올림해주세요

# 쿼리를 작성하는 목표, 확인할 지표: 트레이너 ID, 트레이너의 이름, 승리한 횟수, 보유한 포켓몬의 수, 평균 포켓몬의 레벨
# 쿼리 계산 방법: battle 테이블 -> winner_id, 승리 횟수 COUNT + 트레이너 이름 + trainer_pokemon의 포켓몬 수, 포켓몬 레벨
# 데이터의 기간: -
# 사용할 테이블: battle, trainer, trainer_pokemon
# JOIN KEY: winner_id, trainer_id, id
# 데이터 특징: 보유하다는 status != 'Released'

WITH base AS (
    SELECT
        winner_id
      , COUNT(id) AS cnt
    FROM `basic.battle`
    WHERE
        winner_id IS NOT NULL
    GROUP BY
        winner_id
    ORDER BY
        cnt DESC
    LIMIT 1
), winner_trainer AS (
    SELECT
        b.winner_id
      , b.cnt
      , t.name
    FROM `base` AS b
    LEFT JOIN `basic.trainer` AS t
    ON b.winner_id = t.id
)

SELECT
    wt.winner_id
  , wt.name
  , wt.cnt AS win_cnt
  , COUNT(*) AS pokemon_cnt
  , ROUND(AVG(tp.level), 2) AS avg_level
FROM `winner_trainer` AS wt
JOIN (
      SELECT
          trainer_id
        , level
        , id
      FROM `basic.trainer_pokemon`
      WHERE
          status != 'Released'
     ) AS tp
ON wt.winner_id = tp.trainer_id
GROUP BY
    wt.winner_id
  , wt.cnt
  , wt.name;
