--created a database and schema 
USE ROLE ACCOUNTADMIN;
USE WAREHOUSE COMPUTE_WH;
CREATE OR REPLACE DATABASE {{env}}_ED2FROM;
CREATE OR REPLACE SCHEMA {{schema_name}};

USE {{env}}_ED2FROM.{{schema_name}};

CREATE OR REPLACE TRANSIENT TABLE EMP_DETAILS(
EMPID INT,
EMPNAME VARCHAR(20),
EMPMGRID INT,
SALARY NUMBER(5,2)
);