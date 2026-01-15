USE ROLE ACCOUNTADMIN;

CREATE ROLE IF NOT EXISTS khoa_fivetran_role;
GRANT ROLE khoa_fivetran_role TO USER "khoa.ngo@infinitelambda.com";
GRANT ROLE khoa_fivetran_role TO ROLE SYSADMIN;

-- 1. Compute
GRANT USAGE ON WAREHOUSE khoa_wh TO ROLE khoa_fivetran_role;

-- 2. Database Entry
GRANT USAGE ON DATABASE khoa_dev_db TO ROLE khoa_fivetran_role;
GRANT CREATE SCHEMA ON DATABASE khoa_dev_db TO ROLE khoa_fivetran_role;  -- needed to pass Fivetran's "Internal Stage Access Test"


-- 3. RAW SCHEMA (Write/Transform Target)
GRANT USAGE ON SCHEMA khoa_dev_db.raw TO ROLE khoa_fivetran_role;
GRANT CREATE TABLE, CREATE VIEW ON SCHEMA khoa_dev_db.raw TO ROLE khoa_fivetran_role;
GRANT SELECT ON ALL TABLES IN SCHEMA khoa_dev_db.raw TO ROLE khoa_fivetran_role;
GRANT SELECT ON ALL VIEWS IN SCHEMA khoa_dev_db.raw TO ROLE khoa_fivetran_role;
GRANT SELECT ON FUTURE TABLES IN SCHEMA khoa_dev_db.raw TO ROLE khoa_fivetran_role;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA khoa_dev_db.raw TO ROLE khoa_fivetran_role;
