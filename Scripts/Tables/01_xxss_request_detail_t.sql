
/***
-- ====================================================================================
-- NAME...:  01_xxss_request_detail_t.sql
-- 
-- DESC...: To Store the Self Service Request Master Detail informations
-- 
-- HISTORY: 
-- 
-- Version  WHO              WHAT                                         WHEN
-- -------  ---------------  -------------------------------------------- ------------
-- s1.0     Narendar-4iApps  Initial File                                 03-Jul-2025
-- ====================================================================================
***/

create table xxss_request_master
(
    req_id              number,
    req_name            varchar2(30)   not null,
    req_description     varchar2(240),
    req_short_name      varchar2(3),
    auto_num_yn         varchar2(1)   not null,
    next_number         number,
    wf_item_type        varchar2(30),
    wf_process_name     varchar2(240),
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

create table xxss_request_details
(
    rd_id               number,
    req_id              number,  
    rd_seq_num          number,
    rd_datatype         varchar2(240),
    rd_item             varchar2(240),
    rd_lookup_type      varchar2(240),
    rd_mandatory_yn     varchar2(1),
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

alter table xxss_request_master  add constraint xxss_request_master_pk  primary key (req_id);

alter table xxss_request_details add constraint xxss_request_details_pk primary key (rd_id);

alter table xxss_request_details add constraint xxss_request_details_fk foreign key (req_id) references xxss_request_master (req_id);

create sequence xxss_pk_id_s start with 1 increment by 1 nocache nocycle;

grant all on xxss_request_master to apps;

grant all on xxss_request_details to apps;