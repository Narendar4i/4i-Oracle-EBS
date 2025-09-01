/***
-- ====================================================================================
-- NAME...:  15_xxss_request_info_v.sql
-- 
-- DESC...:  To View the Self Service Request Master-Detail Information
-- 
-- HISTORY: 
-- 
-- Version  WHO              WHAT                                         WHEN
-- -------  ---------------  -------------------------------------------- ------------
-- s1.0     Narendar-4iApps  Initial File                                 16-Jul-2025
-- ====================================================================================
***/
create or replace view xxss_request_info_v
(
    row_id,
    req_id,
    req_name,
    req_description,
    req_short_name,
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
    rd_id,
    rd_seq_num,
    rd_item,
    rd_datatype,
    rd_lookup_type,
    rd_mandatory_yn,
    rd_display_yn,
    rd_attribute_category,
    rd_attribute1,
    rd_attribute2,
    rd_attribute3,
    rd_attribute4,
    rd_attribute5,
    created_by,
    creation_date,
    last_updated_by,
    last_update_date,
    last_update_login
)
as
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
      xrd.rd_id,
      xrd.rd_seq_num,
      xrd.rd_item,
      flv.meaning,
      xrd.rd_lookup_type,
      xrd.rd_mandatory_yn,
      xrd.rd_display_yn,
      xrd.attribute_category,
      xrd.attribute1,
      xrd.attribute2,
      xrd.attribute3,
      xrd.attribute4,
      xrd.attribute5,
      xrm.created_by,
      xrm.creation_date,
      xrm.last_updated_by,
      xrm.last_update_date,
      xrm.last_update_login
from  xxss_request_master xrm,
      xxss_request_details xrd,
      fnd_lookup_values    flv
where xrm.req_id        = xrd.req_id
and   xrd.rd_datatype   = flv.lookup_code
and   flv.lookup_type   = 'XXSS_DATA_TYPE'
order by req_id, rd_seq_num;