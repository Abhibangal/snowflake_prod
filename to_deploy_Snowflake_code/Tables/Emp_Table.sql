--created a database and schema 
--USE WAREHOUSE COMPUTE_WH;
CREATE OR REPLACE TRANSIENT TABLE DATAMART.EMP_DETAILS(
EMPID INT,
EMPNAME VARCHAR(20),
EMPMGRID INT,
SALARY NUMBER(5,2)
);