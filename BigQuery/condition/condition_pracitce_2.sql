-- 2. 포켓몬의 'type1'에 따라 'Water', 'Fire', 'Electric' 타입은 각자 '물', '불', '전기'로, 그 외 타입은 '기타'로 분류하는 새로운 컬럼 'type_Korean'을 만들어 주세요

# 쿼리를 작성하는 목표, 확인할 지표: type1별 새로운 컬럼 생성
# 쿼리 계산 방법: CASE-WHEN
# 데이터의 기간: -
# 사용할 테이블: pokemon
# JOIN KEY: -
# 데이터 특징:
  -- type1: Str 타입

SELECT
    id
  , kor_name
  , type1
  , CASE WHEN type1 = 'Water' THEN '물'
         WHEN type1 = 'Fire' THEN '불'
         WHEN type1 = 'Electric' THEN '전기'
         ELSE '기타'
    END AS type_Korean
FROM `basic.pokemon`;
