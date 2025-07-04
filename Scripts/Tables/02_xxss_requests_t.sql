/***
-- ====================================================================================
-- NAME...:  02_xxss_requests_t.sql
-- 
-- DESC...:  To Store the Self Service Requested Information by the User
-- 
-- HISTORY: 
-- 
-- Version  WHO              WHAT                                         WHEN
-- -------  ---------------  -------------------------------------------- ------------
-- s1.0     Narendar-4iApps  Initial File                                 03-Jul-2025
-- ====================================================================================
***/
create table xxapex.xxss_requests
(
    request_id          number         not null,
    request_num         varchar2(30)   not null,
    request_date        date           not null,
    req_id              number         not null,
    user_id             number         not null,
    person_id           number         not null,
    org_id              number         not null,
    request_info        clob           not null,
    request_description varchar2(240),
    request_status      varchar2(30),
    wf_item_type        varchar2(30),
    wf_item_key         varchar2(240),
    wf_process_name     varchar2(240),
    flow_with           varchar2(240),
    attribute_category  varchar2(240),
    attribute1          varchar2(240),
    attribute2          varchar2(240),
    attribute3          varchar2(240),
    attribute4          varchar2(240),
    attribute5          varchar2(240),
    created_by          number         not null,
    creation_date       date           not null,
    last_updated_by     number         not null,
    last_update_date    date           not null,
    last_update_login   number
);

alter table xxapex.xxss_requests add constraint xxss_requests_pk primary key (request_id);

alter table xxapex.xxss_requests add constraint xxss_requests_fk foreign key (req_id) references xxss_request_master (req_id);

grant all on xxapex.xxss_requests to xxapex;