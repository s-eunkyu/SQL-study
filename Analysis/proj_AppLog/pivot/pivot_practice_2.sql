-- 2. orders 테이블에서 날짜(order_date)별로 유저들의 주문 금액(amount)의 합계를 PIVOT 해주세요. user_id를 행(Row)으로, order_date를 열(Column)으로 만들어야 합니다
-- orders: `amount`, `order_date`, `order_id`, `user_id`

SELECT
    user_id
  , SUM(IF(order_date='2023-05-01', amount, 0)) AS `2023-05-01`
  , SUM(IF(order_date='2023-05-02', amount, 0)) AS `2023-05-02`
  , SUM(IF(order_date='2023-05-03', amount, 0)) AS `2023-05-03`
  , SUM(IF(order_date='2023-05-04', amount, 0)) AS `2023-05-04`
  , SUM(IF(order_date='2023-05-05', amount, 0)) AS `2023-05-05`
FROM `advanced.orders`
GROUP BY
    user_id
ORDER BY
    user_id;
