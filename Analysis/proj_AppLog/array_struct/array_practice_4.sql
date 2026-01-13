-- 4. 앱 로그 데이터(app_logs)의 배열을 풀어주세요

SELECT
    user_id
  , event_date
  , event_name
  , user_pseudo_id
  , eparam.key
  , eparam.value.string_value
  , eparam.value.int_value
FROM `advanced.app_logs`
CROSS JOIN UNNEST(event_params) AS eparam;
