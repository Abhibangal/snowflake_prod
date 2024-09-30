-- Create a database and schema using accountadmin roll
Use role AccountAdmin;
create database test_analytics;
create schema dw_stage;

-- Grant the ownership and all privilieges of the database to Sysadmin 
grant ownership  on database test_analytics to role sysadmin with grant option;
grant all privileges on schema dw_stage to role sysadmin with grant option;
grant all privileges on future schemas in database test_analytics to role sysadmin with grant option;
grant all privileges on future stages in schema dw_stage to role sysadmin with grant option;
grant all privileges on future file formats in schema dw_stage to role sysadmin with grant option;
grant all privileges on future tables in schema dw_stage to role sysadmin with grant option;
-- Create a new user  using USERADMIN and assign the Role Developer Role using SecurityAdmin 
use role sysadmin;
use database test_analytics;

--Grant Usage access to new DEVELOPER role on Database ,Schema and Warehouse
grant usage on database test_analytics to role developer;
grant usage on schema dw_stage to role developer;
grant usage on warehouse compute_wh to role developer;

-- Grant Objectprivileges to Role developer
grant create schema  on database test_analytics to role developer;
grant create table on schema dw_stage to role developer;
grant create external table  on schema dw_stage to role developer;
grant create iceberg table  on schema dw_stage to role developer;
grant create  view on schema dw_stage to role developer;
grant create file format  on schema dw_stage to role developer;
grant create stage  on schema dw_stage to role developer;
grant create task  on schema dw_stage to role developer;
grant create stream  on schema dw_stage to role developer;
grant create pipe  on schema dw_stage to role developer;

GRANT MODIFY ON SCHEMA dw_stage TO ROLE DEVELOPER;

grant role developer to role sysadmin;
show grants to role developer;

grant ownership on warehouse compute_wh to sysadmin revoke current grants;

show grants to role securityadmin;