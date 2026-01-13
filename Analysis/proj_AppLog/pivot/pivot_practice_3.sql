-- 3. orders 테이블에서 사용자(user_id)별, 날짜(order_date)별로 주문이 있다면 1, 없다면 0으로 PIVOT 해주세요. user_id를 행(Row)으로, order_date를 열(Column)로 만들고 주문을 많이 해도 1로 처리합니다
-- orders: `amount`, `order_date`, `order_id`, `user_id`

SELECT
    user_id
  , IF(SUM(IF(order_date='2023-05-01', amount, 0)) > 0, 1, 0) AS `2023-05-01`
  , IF(SUM(IF(order_date='2023-05-02', amount, 0)) > 0, 1, 0) AS `2023-05-02`
  , IF(SUM(IF(order_date='2023-05-03', amount, 0)) > 0, 1, 0) AS `2023-05-03`
  , IF(SUM(IF(order_date='2023-05-04', amount, 0)) > 0, 1, 0) AS `2023-05-04`
  , IF(SUM(IF(order_date='2023-05-05', amount, 0)) > 0, 1, 0) AS `2023-05-05`
FROM `advanced.orders`
GROUP BY
    user_id
ORDER BY
    user_id;
