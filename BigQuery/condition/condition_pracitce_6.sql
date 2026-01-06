-- 6. 배틀에서 승자(winner_id)가 player1_id와 같으면 'Player 1 Wins', player2_id와 같으면 'Player 2 Wins', 그렇지 않으면 'Draw'로 결과가 나오게 해주세요

# 쿼리를 작성하는 목표, 확인할 지표: 승패 결과
# 쿼리 계산 방법: CASE-WHEN
# 데이터의 기간: -
# 사용할 테이블: battle
# JOIN KEY: -
# 데이터 특징: -

SELECT
    id
  , player1_id
  , player2_id
  , winner_id
  , CASE WHEN winner_id = player1_id THEN 'Player 1 Wins'
         WHEN winner_id = player2_id THEN 'Player 2 Wins'
         ELSE 'Draw'
    END AS result
FROM `basic.battle`;
