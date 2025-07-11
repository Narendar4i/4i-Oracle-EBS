/***
-- ====================================================================================
-- NAME...:  05_xxss_req_approval_hist_v.sql
-- 
-- DESC...:  To View the Self Service Request Approval History.
-- 
-- HISTORY: 
-- 
-- Version  WHO              WHAT                                         WHEN
-- -------  ---------------  -------------------------------------------- ------------
-- s1.0     Narendar-4iApps  Initial File                                 10-Jul-2025
-- ====================================================================================
***/
create or replace view xxss_req_approval_hist_v (
    row_id,
    approver_hist_id,
    request_id,
    iteration,
    response,
    approver_comments,
    approver_id,
    approver_name,
    wf_item_key,
    submission_date,
    action_date,
    organization,
    approver_role,
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
       approver_hist_id,
       request_id,
       iteration,
       response,
       approver_comments,
       approver_id,
       approver_name,
       wf_item_key,
       submission_date,
       action_date,
       organization,
       approver_role,
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
from   xxss_req_approval_hist;