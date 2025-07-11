/***
-- ====================================================================================
-- NAME...:  03_xxss_req_approval_hist_t.sql
-- 
-- DESC...: To Store approver history details 
-- 
-- HISTORY: 
-- 
-- Version  WHO             WHAT                                         WHEN
-- -------  --------------- -------------------------------------------- ------------
-- s1.0      Vignesh M     Initial File                                 13-Mar-2013
-- ====================================================================================
***/

create table xxss_req_approval_hist
(
 approver_hist_id   number
,request_id         number
,iteration          number
,response           varchar2(30)
,approver_comments  varchar2(4000)
,approver_id        number
,approver_name      varchar2(240)
,wf_item_key        varchar2(240)
,submission_date    date
,action_date        date
,organization       varchar2(240)
,approver_role      varchar2(30)
,attribute_category varchar2(240)
,attribute1         varchar2(240)
,attribute2         varchar2(240)
,attribute3         varchar2(240)
,attribute4         varchar2(240)
,attribute5         varchar2(240)
,attribute6         varchar2(240)
,attribute7         varchar2(240)
,attribute8         varchar2(240)
,attribute9         varchar2(240)
,attribute10        varchar2(240)
,created_by         number            not null
,creation_date      date              not null
,last_updated_by    number            not null
,last_update_date   date              not null
,last_update_login  number
);


alter table xxss_req_approval_hist add constraint xxss_req_approval_hist_pk primary key (approver_hist_id);

alter table xxss_req_approval_hist add constraint xxss_req_approval_hist_fk foreign key (request_id)
references xxss_requests(request_id);

create sequence xxss_approver_hist_id_s start with 1 increment by 1 nocache;

grant all on xxss_req_approval_hist to apps;

grant all on xxss_approver_hist_id_s to apps;