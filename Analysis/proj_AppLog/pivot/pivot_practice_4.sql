SELECT
    user_id
  , event_date
  , event_name
  , event_timestamp
  , user_pseudo_id
  , MAX(IF(par.key='firebase_screen', par.value.string_value, NULL)) AS firebase_screen
  , MAX(IF(par.key='food_id', par.value.int_value, NULL)) AS food_id
  , MAX(IF(par.key='session_id', par.value.string_value, NULL)) AS session_id
FROM `advanced.app_logs`
CROSS JOIN UNNEST(event_params) AS par
GROUP BY ALL;
