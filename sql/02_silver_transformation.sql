/* VORTEX EVENTS - SILVER LAYER (CLEANSING)
  Purpose: Standardize types, fix regional date formats (DD/MM/YYYY), and sanitize strings.
*/

CREATE OR REPLACE TABLE `vortex-events.Ticketing_Data.prod_ticket_sales_cleansed` AS
SELECT 
  -- Fix regional date errors for BigQuery compatibility
  SAFE.PARSE_DATE('%d/%m/%Y', event_date) AS event_date,
  SAFE.PARSE_DATE('%d/%m/%Y', birthday_date) AS birthday_date,
  SAFE.PARSE_DATE('%d/%m/%Y', update_date) AS update_date,

  -- Standardize text fields
  TRIM(event_name) AS event_name,
  TRIM(location) AS location,
  TRIM(artist_name) AS artist_name,
  TRIM(musical_genre) AS musical_genre,
  LOWER(TRIM(client_email)) AS client_email,
  
  -- Pass-through attributes
  vendor,
  gender,
  national_id,
  marketing_interests,
  ticket_type,
  promo_code
FROM `vortex-events.Ticketing_Data.staging_sales_raw`
WHERE event_date IS NOT NULL;
