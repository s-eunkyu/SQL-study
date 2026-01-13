-- 1. orders 테이블에서 유저(user_id)별로 주문 금액(amount)의 합계를 PIVOT 해주세요. 날짜(order_date)를 행(Row)으로, user_id를 열(Column)으로 만들어야 합니다
-- orders: `amount`, `order_date`, `order_id`, `user_id`

SELECT
    order_date
  , SUM(IF(user_id = 1, amount, 0)) AS user_1
  , SUM(IF(user_id = 2, amount, 0)) AS user_2
  , SUM(IF(user_id = 3, amount, 0)) AS user_3
FROM `advanced.orders`
GROUP BY
    order_date
ORDER BY
    order_date;
