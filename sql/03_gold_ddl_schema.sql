/* VORTEX EVENTS - GOLD LAYER (DIMENSIONAL MODEL)
  Purpose: Define the comprehensive Star Schema for Business Intelligence.
  Target Project: vortex-events
*/

-- 1. CLIENT DIMENSION: Unified customer profiles and PII handling
CREATE OR REPLACE TABLE `vortex-events.Ticketing_Data.Dim_Client` (
  client_id STRING OPTIONS(description="Unique hash (FARM_FINGERPRINT)"),
  client_email STRING,
  first_name STRING,
  last_name STRING,
  birthday_date DATE,
  gender STRING,
  registration_date DATETIME,
  registration_source STRING
);

-- 2. ARTIST DIMENSION: Musical genre and performer metadata
CREATE OR REPLACE TABLE `vortex-events.Ticketing_Data.Dim_Artist` (
  artist_name STRING,
  musical_genre STRING
);

-- 3. LOCATION DIMENSION: Geographic hierarchy for Miami, Madrid, & BA
CREATE OR REPLACE TABLE `vortex-events.Ticketing_Data.Dim_Location` (
  location_name STRING, -- Raw venue name
  location_city STRING,
  location_country STRING
);

-- 4. EVENT DIMENSION: The "What" and "When" of the vortex
CREATE OR REPLACE TABLE `vortex-events.Ticketing_Data.Dim_Event` (
  event_name STRING,
  event_date DATE,
  musical_genre STRING
);

-- 5. VENDOR DIMENSION: Tracking platform performance (Ticketmaster, etc.)
CREATE OR REPLACE TABLE `vortex-events.Ticketing_Data.Dim_Vendor` (
  vendor_name STRING,
  vendor_email STRING
);

-- 6. TICKET SALE FACT TABLE: The quantitative heart of the model
CREATE OR REPLACE TABLE `vortex-events.Ticketing_Data.Fact_Ticket_Sale` (
  client_email STRING, -- Linking key
  event_name STRING,   -- Linking key
  event_date DATE,
  ticket_type STRING,
  promo_code STRING,
  update_date DATE     -- Ingestion metadata for Monday triggers
);
