
/***
-- ====================================================================================
-- NAME...:  02_xxss_request_details_t.sql
-- 
-- DESC...: To Store the Self Service Request Detail informations
-- 
-- HISTORY: 
-- 
-- Version  WHO              WHAT                                         WHEN
-- -------  ---------------  -------------------------------------------- ------------
-- s1.0     Narendar-4iApps  Initial File                                 03-Jul-2025
-- ====================================================================================
***/

create table xxss_request_details
(
    req_det_id          number,
    req_id              number,  
    rd_seq_num          number,
    rd_type             varchar2(240),
    rd_field            varchar2(240),
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

alter table xxss_request_details add constraint xxss_request_details_fk foreign key (req_id) references xxss_request_master (request_id);