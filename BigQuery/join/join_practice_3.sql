-- 3. 트레이너의 고향(hometown)과 포켓몬을 포획한 위치(location)를 비교하여, 자신의 고향에서 포켓몬을 포획한 트레이너의 수를 계산해주세요 (status는 신경 쓰지 않음)

# 쿼리를 작성하는 목표, 확인할 지표: 고향에서 포켓몬을 포획한 트레이너의 수
# 쿼리 계산 방법: JOIN 후 COUNT(DISTINCT traner_id)
# 데이터의 기간: -
# 사용할 테이블: trainer_pokemon, trainer
# JOIN KEY: trainer_id, id
# 데이터 특징: -

SELECT
    COUNT(DISTINCT tp.trainer_id) AS cnt
FROM `basic.trainer_pokemon` AS tp
JOIN `basic.trainer` AS t
  ON tp.trainer_id = t.id
WHERE
    tp.location = t.hometown;
