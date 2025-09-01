/***
-- ====================================================================================
-- NAME...:  18_xxss_approval_list_v.sql
-- 
-- DESC...:  View script for approval list
-- 
-- HISTORY: 
-- 
-- Version  WHO              WHAT                                         WHEN
-- -------  ---------------  -------------------------------------------- ------------
-- s1.0     Navu-4iApps      Initial File                                 29-Aug-2025
-- ====================================================================================
***/
create or replace view xxss_approval_list_v (
    row_id,
    appr_id,
    req_id,
    seq_num,
    appr_type,
    sql_query,
    person_id,
    employee_number,
    employee_name,
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
select al.rowid,
       al.appr_id,
       al.req_id,
       al.seq_num,
       al.appr_type,
       al.sql_query,
       al.person_id,
       e.employee_number,
       e.full_name,
       al.attribute_category,
       al.attribute1,
       al.attribute2,
       al.attribute3,
       al.attribute4,
       al.attribute5,
       al.created_by,
       al.creation_date,
       al.last_updated_by,
       al.last_update_date,
       al.last_update_login
from   xxss_approval_list al, per_all_people_f e
where  al.person_id           = e.person_id (+)
and    trunc(sysdate)   between e.effective_start_date(+) and e.effective_end_date(+) ;