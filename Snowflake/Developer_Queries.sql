USE TEST_ANALYTICS.AIRLINES;
--SINCE OUR CONTAINER RAW/CSV ON WHICH WE ARE CREATING THE STAGE ONLY STORES CSV FILE SO WE WILL BE SETTING FILE FORMAT AT STAGE LEVEL.
--CREATE A FILE FORMAT
CREATE OR REPLACE FILE FORMAT AIRLINES_CSV_FORMAT
TYPE = CSV
COMPRESSION = GZIP
PARSE_HEADER = TRUE
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
EMPTY_FIELD_AS_NULL = TRUE
TRIM_SPACE = TRUE;

-- Create an external stage test_airlines_blob_stg
CREATE OR REPLACE STAGE TEST_AIRLINES_BLOB_STG
URL = 'azure://abhiformula1dl.blob.core.windows.net/raw/csv/'
STORAGE_INTEGRATION = AZUREBLOB_INT
FILE_FORMAT = AIRLINES_CSV_FORMAT;

--CHECK THE ROLES FOR DEVELOPER ROLE
SHOW GRANTS TO ROLE DEVELOPER;
-- TEST WHETHER THE STAGE FILE CAN BE ACCESSED USING CRAETED FILE FORMAT
SELECT $1 FROM @TEST_ANALYTICS.AIRLINES.TEST_AIRLINES_BLOB_STG/AIRLINES_DATA.CSV.GZ;

-- GRANT USAGE ACCESS TO SYSADMIN AND ACCOUNTADMIN IF INITIALLY NOT SET FUTURE OBJECT ACCESS FOR THIS ROLE
GRANT USAGE ON FILE FORMAT AIRLINES_CSV_FORMAT TO ROLE SYSADMIN;

-- CREATE A TABLE USING TEMPLATE OPTION WHERE IN YOU NEED TO USE INFER_SCHEMA FUNCTION AND PARSE_HEADER = TRUE OPTION IN FILE FORMAT.tHIS WILL JUST CREATE A STRUCTURE FOR YOU STAGE TABLE
CREATE OR REPLACE TRANSIENT TABLE AIRLINES_STG USING TEMPLATE
(
	
	SELECT ARRAY_AGG(OBJECT_CONSTRUCT(*))
	WITHIN GROUP (ORDER BY ORDER_ID) 
	FROM TABLE(INFER_SCHEMA(
			LOCATION => '@test_analytics.airlines.test_airlines_blob_stg/Airlines_Data.csv.gz',
			file_format => 'TEST_ANALYTICS.AIRLINES.AIRLINES_CSV_FORMAT'
		)
	)
);

