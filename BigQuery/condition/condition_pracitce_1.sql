-- 1. 포켓몬의 'Speed'가 70 이상이면 '빠름', 그렇지 않다면 '느림'으로 표시하는 새로운 컬럼 'Speed_Category'를 만들어주세요

# 쿼리를 작성하는 목표, 확인할 지표: Speed 기준 새로운 컬럼 생성
# 쿼리 계산 방법: IF
# 데이터의 기간: -
# 사용할 테이블: pokemon
# JOIN KEY: -
# 데이터 특징:
  -- speed: INT 타입 (Not null)

SELECT
    *
  , IF(speed >= 70, '빠름', '느림') AS Speed_Category
FROM `basic.pokemon`;
