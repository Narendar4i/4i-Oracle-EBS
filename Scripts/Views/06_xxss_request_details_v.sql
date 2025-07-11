/***
-- ====================================================================================
-- NAME...:  05_xxss_request_details_v.sql
-- 
-- DESC...:  To View the Self Service Request Detail Information
-- 
-- HISTORY: 
-- 
-- Version  WHO              WHAT                                         WHEN
-- -------  ---------------  -------------------------------------------- ------------
-- s1.0     Narendar-4iApps  Initial File                                 10-Jul-2025
-- ====================================================================================
***/
create or replace view xxss_request_details_v (
    row_id,
    rd_id,
    req_id,
    rd_seq_num,
    rd_datetype,
    rd_item,
    rd_lookup_type,
    rd_mandatory_yn,
    rd_display_yn,
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
       rd_id,
       req_id,  
       rd_seq_num,
       rd_datatype,
       rd_item,
       rd_lookup_type,
       rd_mandatory_yn,
       rd_display_yn,
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
from   xxss_request_details;