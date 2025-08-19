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

create synonym xxss_req_approval_hist for xxapex.xxss_req_approval_hist;

create synonym xxss_req_id_s for xxapex.xxss_req_id_s;

create synonym xxss_rd_id_s for xxapex.xxss_rd_id_s;

create synonym xxss_request_id_s for xxapex.xxss_request_id_s;

create synonym xxss_wf_itemkey_s for xxapex.xxss_wf_itemkey_s;

create synonym xxss_approver_hist_id_s for xxapex.xxss_approver_hist_id_s;
