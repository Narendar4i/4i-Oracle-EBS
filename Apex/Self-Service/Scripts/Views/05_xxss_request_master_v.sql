/***
-- ====================================================================================
-- NAME...:  04_xxss_request_master_v.sql
-- 
-- DESC...:  To View the Self Service Request Master Information
-- 
-- HISTORY: 
-- 
-- Version  WHO              WHAT                                         WHEN
-- -------  ---------------  -------------------------------------------- ------------
-- s1.0     Narendar-4iApps  Initial File                                 10-Jul-2025
-- ====================================================================================
***/
create or replace view xxss_request_master_v (
    row_id,
    req_id,
    request_name,
    request_description,
    request_short_name,
    auto_num_yn,
    next_number,
    wf_item_type,
    wf_process_name,
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
    last_update_login,
    constraint xxss_request_master_v_pk primary key (req_id) rely disable novalidate 
) as
select 
      xrm.rowid,
      xrm.req_id,
      xrm.req_name,
      xrm.req_description,
      xrm.req_short_name,
      xrm.auto_num_yn,
      xrm.next_number,
      xrm.wf_item_type,
      xrm.wf_process_name,
      xrm.attribute_category,
      xrm.attribute1,
      xrm.attribute2,
      xrm.attribute3,
      xrm.attribute4,
      xrm.attribute5,
      xrm.created_by,
      xrm.creation_date,
      xrm.last_updated_by,
      xrm.last_update_date,
      xrm.last_update_login
from  xxss_request_master xrm;