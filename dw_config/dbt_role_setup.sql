USE ROLE ACCOUNTADMIN;

CREATE ROLE IF NOT EXISTS khoa_dbt_role;
GRANT ROLE khoa_dbt_role TO USER "khoa.ngo@infinitelambda.com";
GRANT ROLE khoa_dbt_role TO ROLE SYSADMIN;

-- 1. Compute
GRANT USAGE ON WAREHOUSE khoa_wh TO ROLE khoa_dbt_role;

-- 2. Database Entry
GRANT USAGE ON DATABASE khoa_dev_db TO ROLE khoa_dbt_role;

-- 3. RAW SCHEMA (Read-Only Source)
GRANT USAGE ON SCHEMA khoa_dev_db.raw TO ROLE khoa_dbt_role;
GRANT SELECT ON ALL TABLES IN SCHEMA khoa_dev_db.raw TO ROLE khoa_dbt_role;
GRANT SELECT ON ALL VIEWS IN SCHEMA khoa_dev_db.raw TO ROLE khoa_dbt_role;
GRANT SELECT ON FUTURE TABLES IN SCHEMA khoa_dev_db.raw TO ROLE khoa_dbt_role;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA khoa_dev_db.raw TO ROLE khoa_dbt_role;

-- 4. ANALYTICS SCHEMA (Write/Transform Target)
GRANT USAGE ON SCHEMA khoa_dev_db.analytics TO ROLE khoa_dbt_role;
GRANT CREATE TABLE, CREATE VIEW ON SCHEMA khoa_dev_db.analytics TO ROLE khoa_dbt_role;

-- Grant full DML (Insert/Update) for dbt incremental models
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA khoa_dev_db.analytics TO ROLE khoa_dbt_role;
GRANT ALL PRIVILEGES ON ALL VIEWS IN SCHEMA khoa_dev_db.analytics TO ROLE khoa_dbt_role;
GRANT ALL PRIVILEGES ON FUTURE TABLES IN SCHEMA khoa_dev_db.analytics TO ROLE khoa_dbt_role;
GRANT ALL PRIVILEGES ON FUTURE VIEWS IN SCHEMA khoa_dev_db.analytics TO ROLE khoa_dbt_role;
