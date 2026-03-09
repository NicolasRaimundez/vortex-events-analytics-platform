/* VORTEX EVENTS - GOLD ORCHESTRATION
  Purpose: Master Stored Procedure to refresh dimensions and upsert facts.
  Frequency: Triggered every Monday at 12:00 PM.
*/

CREATE OR REPLACE PROCEDURE `vortex-events.Ticketing_Data.sp_Final_Model_Load`()
BEGIN
  -- A. UPSERT CLIENTS: Refresh 200k+ historical records
  MERGE `vortex-events.Ticketing_Data.Dim_Client` T
  USING (
    SELECT DISTINCT client_email, gender, birthday_date, MIN(update_date) as reg_date
    FROM `vortex-events.Ticketing_Data.prod_ticket_sales_cleansed`
    GROUP BY 1, 2, 3
  ) S
  ON T.client_email = S.client_email
  WHEN MATCHED THEN
    UPDATE SET T.gender = S.gender 
  WHEN NOT MATCHED THEN
    INSERT (client_id, client_email, gender, birthday_date, registration_date)
    VALUES (CAST(FARM_FINGERPRINT(S.client_email) AS STRING), S.client_email, S.gender, S.birthday_date, S.reg_date);

  -- B. GEOGRAPHIC NORMALIZATION: Split 'City, Country'
  INSERT INTO `vortex-events.Ticketing_Data.Dim_Location` (location_name, location_city, location_country)
  SELECT DISTINCT 
    location, 
    SPLIT(location, ', ')[SAFE_OFFSET(0)], 
    SPLIT(location, ', ')[SAFE_OFFSET(1)]
  FROM `vortex-events.Ticketing_Data.prod_ticket_sales_cleansed`
  WHERE location NOT IN (SELECT location_name FROM `vortex-events.Ticketing_Data.Dim_Location`);

  -- C. FACT LOADING: Append only new Monday batch
  INSERT INTO `vortex-events.Ticketing_Data.Fact_Ticket_Sale`
  SELECT client_email, event_name, event_date, ticket_type, promo_code, update_date
  FROM `vortex-events.Ticketing_Data.prod_ticket_sales_cleansed`
  WHERE update_date = CURRENT_DATE();
END;
