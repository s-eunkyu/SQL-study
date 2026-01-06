-- 4. 각 트레이너의 배지 개수(badge_count)를 기준으로, 5개 이하면 'Beginner', 6개에서 8개 사이면 'Intermediate', 그 이상이면 'Advanced'로 분류해주세요

# 쿼리를 작성하는 목표, 확인할 지표: 배지 개수 기반 새로운 지표 생성
# 쿼리 계산 방법: CASE-WHEN
# 데이터의 기간: -
# 사용할 테이블: trainer
# JOIN KEY: -
# 데이터 특징:
  -- badge_count: INT 타입

SELECT
    id
  , name
  , badge_count
  , CASE WHEN badge_count <= 5 THEN 'Beginner'
         WHEN badge_count <= 8 THEN 'Intermediate'
         ELSE 'Advanced'
    END AS class
FROM `basic.trainer`;
