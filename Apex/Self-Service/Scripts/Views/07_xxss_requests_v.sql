/***
-- ====================================================================================
-- NAME...:  05_xxss_requests_v.sql
-- 
-- DESC...:  To View the Self Service Request Information
-- 
-- HISTORY: 
-- 
-- Version  WHO              WHAT                                         WHEN
-- -------  ---------------  -------------------------------------------- ------------
-- s1.0     Narendar-4iApps  Initial File                                 10-Jul-2025
-- ====================================================================================
***/
create or replace view xxss_requests_v (
    row_id,
    request_id,
    request_num,
    request_date,
    req_id,
    user_id,
    person_id,
    org_id,
    request_info,
    request_description,
    request_status,
    wf_item_type,
    wf_item_key,
    wf_process_name,
    flow_with,
    attribute_category,
    attribute1,
    attribute2,
    attribute3,
    attribute4,
    attribute5,
    created_by,
    creation_date,
    last_updated_by,
    last_update_date,
    last_update_login
) as
select rowid,
       request_id,
       request_num,
       request_date,
       req_id,
       user_id,
       person_id,
       org_id,
       request_info,
       request_description,
       request_status,
       wf_item_type,
       wf_item_key,
       wf_process_name,
       flow_with,
       attribute_category,
       attribute1,
       attribute2,
       attribute3,
       attribute4,
       attribute5,
       created_by,
       creation_date,
       last_updated_by,
       last_update_date,
       last_update_login
from   xxss_requests;