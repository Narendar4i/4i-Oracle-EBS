create or replace package xxss_request_details_pkg
as
/***
-- ====================================================================================
-- NAME...:  xxss_request_details_pkh.sql
--
-- DESC...:  Package Body, to insert, update, delete and select records from
--           xss_request_details table.
--
-- HISTORY:
-- 
-- Version  WHO              WHAT                                         WHEN
-- -------  ---------------  -------------------------------------------- ------------
-- s1.0     Narendar-4iApps  Initial File                                 10-Jul-2025
-- ====================================================================================
***/
    procedure insert_row ( p_row_id              in out   varchar2,
                           p_rec                 in out   xxss_request_details%rowtype,
                           p_err_code               out   varchar2,
                           p_err_msg                out   varchar2 );

    procedure update_row ( p_row_id              in out   varchar2,
                           p_rec                 in out   xxss_request_details%rowtype,
                           p_err_code               out   varchar2,
                           p_err_msg                out   varchar2 );
    
    procedure delete_row ( p_row_id              in out   varchar2,
                           p_err_code               out   varchar2,
                           p_err_msg                out   varchar2 );   

end xxss_request_details_pkg;