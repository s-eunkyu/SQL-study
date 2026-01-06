-- 3. 각 트레이너별로 그들이 포켓몬을 포획한 첫 날(catch_date)을 찾고, 그 날짜를 'DD/MM/YYYY' 형식으로 출력해주세요.

# 쿼리를 작성하는 목표, 확인할 지표: 포획 첫 날
# 쿼리 계산 방법: MIN, FORMAT_DATETIME
# 데이터의 기간: -
# 사용할 테이블: trainer_pokemon
# JOIN KEY: -
# 데이터 특징:
  -- catch_date: DATE 타입 -> UTC 기준
  -- catch_datetime: TIMESTAMP 타입 -> UTC 기준
  -- 'Asia/Seoul'로 타임존 설정 후 EXTRACT 기반으로 그룹화 진행

SELECT
    trainer_id
  , FORMAT_DATETIME('%d/%m/%Y',
        MIN(DATETIME(catch_datetime, 'Asia/Seoul'))
    ) AS min_date
FROM `basic.trainer_pokemon`
GROUP BY
    trainer_id
ORDER BY
    trainer_id;
