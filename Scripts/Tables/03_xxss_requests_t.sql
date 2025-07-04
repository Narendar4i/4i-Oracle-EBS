/***
-- ====================================================================================
-- NAME...:  03_xxss_requests_t.sql
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
create table xxss_requests
(
    request_id          number         not null,
    request_num         varchar2(30)   not null,
    request_date        date           not null,
    req_id              number         not null,
    req_user_id         number         not null,
    req_person_id       number         not null,
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

alter table xxss_requests add constraint xxss_requests_pk primary key (request_id);

alter table xxss_requests add constraint xxss_requests_fk foreign key (req_id) references xxss_request_master (request_id);
-- Note: Ensure that xxss_request_master table is created before this table.

create sequence xxss_requests_s start with 10 increment by 10 nocache nocycle;