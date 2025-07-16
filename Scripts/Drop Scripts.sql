drop table xxss_request_details;
drop table xxss_requests;
drop table xxss_req_approval_hist;
drop table xxss_request_master;

drop sequence xxss_request_id_s;
drop sequence xxss_rd_id_s;
drop sequence xxss_approver_hist_id_s;
drop sequence xxss_req_id_s;

select * from all_objects where object_name like 'XXSS%' and object_type = 'SYNONYM';
/

drop synonym xxss_request_master;
drop synonym xxss_request_details;
drop synonym xxss_requests;
drop synonym xxss_requests_all;
drop synonym xxss_req_approval_hist;

delete from xxss_request_master;
delete from xxss_request_details;

drop sequence xxss_req_id_s;
drop sequence xxss_approver_hist_id_s;
drop sequence xxss_request_id_s;
drop sequence xxss_rd_id_s;

