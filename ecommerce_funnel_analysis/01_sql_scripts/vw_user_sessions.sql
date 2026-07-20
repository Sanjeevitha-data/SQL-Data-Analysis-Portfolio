CREATE OR REPLACE VIEW `raw_ecommerce.vw_user_sessions` AS
SELECT 
  user_id,
  user_session,
  MIN(event_time) as session_start,
  MAX(event_time) as session_end,
  TIMESTAMP_DIFF(MAX(event_time), MIN(event_time), MINUTE) as session_duration_minutes,
  COUNTIF(event_type = 'view') as total_views,
  COUNTIF(event_type = 'cart') as total_carts,
  COUNTIF(event_type = 'purchase') as total_purchases,
  CASE WHEN COUNTIF(event_type = 'purchase') > 0 THEN 1 ELSE 0 END as is_converted
FROM `raw_ecommerce.february_events`
WHERE user_session IS NOT NULL
GROUP BY user_id, user_session;
