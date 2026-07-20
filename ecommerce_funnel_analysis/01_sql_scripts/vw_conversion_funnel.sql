CREATE OR REPLACE VIEW `raw_ecommerce.vw_conversion_funnel` AS
SELECT
  '1. Product Views' AS funnel_stage,
  COUNT(DISTINCT user_id) AS unique_users,
  100.0 AS pct_of_total_visitors
FROM `raw_ecommerce.february_events`
WHERE event_type = 'view'

UNION ALL

SELECT
  '2. Cart Additions' AS funnel_stage,
  COUNT(DISTINCT user_id) AS unique_users,
  ROUND((COUNT(DISTINCT user_id) / (SELECT COUNT(DISTINCT user_id) FROM `raw_ecommerce.february_events` WHERE event_type = 'view')) * 100, 2) AS pct_of_total_visitors
FROM `raw_ecommerce.february_events`
WHERE event_type = 'cart'

UNION ALL

SELECT
  '3. Purchases' AS funnel_stage,
  COUNT(DISTINCT user_id) AS unique_users,
  ROUND((COUNT(DISTINCT user_id) / (SELECT COUNT(DISTINCT user_id) FROM `raw_ecommerce.february_events` WHERE event_type = 'view')) * 100, 2) AS pct_of_total_visitors
FROM `raw_ecommerce.february_events`
WHERE event_type = 'purchase'
ORDER BY funnel_stage;
