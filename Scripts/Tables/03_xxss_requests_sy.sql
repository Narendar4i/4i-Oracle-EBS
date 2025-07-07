/***
-- ====================================================================================
-- NAME...:  03_xxss_requests_sy.sql
-- 
-- DESC...:  Synonyms for xxss_request_master, xxss_request_details, and xxss_requests
-- 
-- HISTORY: 
-- 
-- Version  WHO              WHAT                                         WHEN
-- -------  ---------------  -------------------------------------------- ------------
-- s1.0     Narendar-4iApps  Initial File                                 03-Jul-2025
-- ====================================================================================
***/
create synonym xxss_request_master for xxapex.xxss_request_master;

create synonym xxss_request_details for xxapex.xxss_request_details;

create synonym xxss_requests for xxapex.xxss_requests;

create synonym xxss_requests_all for xxapex.xxss_requests;