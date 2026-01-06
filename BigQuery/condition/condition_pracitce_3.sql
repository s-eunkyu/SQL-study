-- 3. 각 포켓몬의 총점(total)을 기준으로, 300 이하면 'Low', 301에서 500 사이면 'Medium', 501이상이면 'High'로 분류해주세요

# 쿼리를 작성하는 목표, 확인할 지표: 총점 기준 새로운 지표
# 쿼리 계산 방법: CASE-WHEN
# 데이터의 기간: -
# 사용할 테이블: pokemon
# JOIN KEY: -
# 데이터 특징:
  -- total: INT 타입 (Not null)

SELECT
    id
  , kor_name
  , total
  , CASE WHEN total <= 300 THEN 'Low'
         WHEN total <= 500 THEN 'Medium'
         WHEN total >= 501 THEN 'High'
    END AS class
FROM `basic.pokemon`;
