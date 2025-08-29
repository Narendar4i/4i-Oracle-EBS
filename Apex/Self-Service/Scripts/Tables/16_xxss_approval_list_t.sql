/***
-- ====================================================================================
-- NAME...:  16_xxss_approval_list_t.sql
-- 
-- DESC...:  To Store the Self Service Approval List for each requests
-- 
-- HISTORY: 
-- 
-- Version  WHO              WHAT                                         WHEN
-- -------  ---------------  -------------------------------------------- ------------
-- s1.0     Navu-4iApps      Initial File                                 29-Aug-2025
-- ====================================================================================
***/
create table xxss_approval_list
(
    appr_id             number         not null,
    req_id              number         not null,
    seq_num             number         not null,
    appr_type           varchar2(1),               -- D (Dynamic) / S (Static)
    sql_query           varchar2(32000),
    person_id           number,
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

alter table xxss_approval_list add constraint xxss_approval_list_pk primary key (appr_id);

alter table xxss_approval_list add constraint xxss_approval_list_fk foreign key (req_id) references xxss_request_master (req_id);


create sequence xxss_appr_id_s start with 1 increment by 1 nocache nocycle;

grant all on xxss_approval_list to apps;
grant all on xxss_appr_id_s to apps;
