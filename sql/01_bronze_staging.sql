/* VORTEX EVENTS - BRONZE LAYER (STAGING)
  Purpose: Raw landing zone for GMail CSV automated ingestion.
  Scale: Optimized for 200,000+ historical records.
*/

CREATE OR REPLACE TABLE `vortex-events.Ticketing_Data.staging_sales_raw` (
  event_date STRING,
  event_name STRING,
  location STRING,
  vendor STRING,
  artist_name STRING,
  musical_genre STRING,
  client_email STRING,
  gender STRING,
  birthday_date STRING,
  national_id STRING,
  marketing_interests STRING,
  ticket_type STRING,
  promo_code STRING,
  update_date STRING -- Metadata added by Apps Script
);
