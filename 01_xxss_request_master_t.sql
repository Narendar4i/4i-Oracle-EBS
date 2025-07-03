
/***
-- ====================================================================================
-- NAME...:  01_xxss_request_master_t.sql
-- 
-- DESC...: To Store the Self Service Request Master informations
-- 
-- HISTORY: 
-- 
-- Version  WHO              WHAT                                         WHEN
-- -------  ---------------  -------------------------------------------- ------------
-- s1.0     Narendar-4iApps  Initial File                                 03-Jul-2025
-- ====================================================================================
***/

create table xxss_request_master_t
(
    request_id          number,
    request_type        varchar2(30)   not null,
    request_description varchar2(240),
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

alter table xxss_request_master_t add constraint xxss_request_id_pk primary key (request_id);

create sequence xxss_request_id_s start with 100 increment by 10 nocache nocycle;

