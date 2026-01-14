-- Open Funnel
-- user_pseudo_id
-- 퍼널의 정의: Welcome -> Home -> Food Category -> Restaurant -> Cart -> 주문하기

-- screen_view(welcome, home, food_category, restaurant, cart)
-- click_payment(cart)
-- step_number: 추후 정렬을 위해 만들 것

-- 사용할 데이터: 앱 로그 데이터, GA/Firebase -> UNNEST -> PIVOT
-- 기간: 2022-08-01 ~ 2022-08-18

WITH base AS (
    SELECT
        event_date
      , event_timestamp
      , event_name
      , user_id
      , user_pseudo_id
      , platform
      , MAX(IF(params.key = 'firebase_screen', params.value.string_value, NULL)) AS firebase_screen
      -- , MAX(IF(params.key = 'food_id', params.value.int_value, NULL)) AS food_id
      , MAX(IF(params.key = 'session_id', params.value.string_value, NULL)) AS session_id
    FROM `advanced.app_logs`
    CROSS JOIN UNNEST(event_params) AS params
    WHERE
        -- event_date = '2022-08-01'
        event_date BETWEEN '2022-08-01' AND '2022-08-18'
    GROUP BY
        ALL
), filter_event_and_concat_event_and_screen AS (
    -- event_name + screen (필요한 이벤트만 WHERE 조건에 걸어서 사용)
    SELECT
        * EXCEPT (event_name, firebase_screen, event_timestamp)
      , CONCAT(event_name, '-', firebase_screen) AS event_name_with_screen
      , DATETIME(TIMESTAMP_MICROS(event_timestamp), 'Asia/Seoul') AS event_datetime
    FROM `base`
    WHERE
        event_name IN ('screen_view', 'click_payment')
)



# 1. 일자 상관 없이 퍼널의 유저 수를 집계한 쿼리
SELECT
    event_name_with_screen
  , CASE
        WHEN event_name_with_screen = 'screen_view-welcome' THEN 1
        WHEN event_name_with_screen = 'screen_view-home' THEN 2
        WHEN event_name_with_screen = 'screen_view-food_category' THEN 3
        WHEN event_name_with_screen = 'screen_view-restaurant' THEN 4
        WHEN event_name_with_screen = 'screen_view-cart' THEN 5
        WHEN event_name_with_screen = 'click_payment-cart' THEN 6
        ELSE NULL
    END AS step_number
  , COUNT(DISTINCT user_pseudo_id) AS cnt
FROM `filter_event_and_concat_event_and_screen`
GROUP BY
    ALL
HAVING
    step_number IS NOT NULL;

# 2. 일자별로 퍼널별 유저 수 쿼리
SELECT
    event_date
  , event_name_with_screen
  , CASE
        WHEN event_name_with_screen = 'screen_view-welcome' THEN 1
        WHEN event_name_with_screen = 'screen_view-home' THEN 2
        WHEN event_name_with_screen = 'screen_view-food_category' THEN 3
        WHEN event_name_with_screen = 'screen_view-restaurant' THEN 4
        WHEN event_name_with_screen = 'screen_view-cart' THEN 5
        WHEN event_name_with_screen = 'click_payment-cart' THEN 6
        ELSE NULL
    END AS step_number
  , COUNT(DISTINCT user_pseudo_id) AS cnt
FROM `filter_event_and_concat_event_and_screen`
GROUP BY
    ALL
HAVING
    step_number IS NOT NULL
ORDER BY
    event_date;
