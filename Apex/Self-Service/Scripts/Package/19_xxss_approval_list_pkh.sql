create or replace package xxss_approval_list_pkg
as
/***
-- ====================================================================================
-- NAME...:  xxss_approval_list_pkh.sql
--
-- DESC...:  Package Body, to insert, update, delete and select records from
--           xxss_approval_list table.
--
-- HISTORY:
-- 
-- Version  WHO              WHAT                                         WHEN
-- -------  ---------------  -------------------------------------------- ------------
-- s1.0     Navu-4iApps      Initial File                                 29-Aug-2025
-- ====================================================================================
***/
    procedure insert_row ( p_row_id              in out   varchar2,
                           p_rec                 in out   xxss_approval_list%rowtype,
                           p_err_code               out   varchar2,
                           p_err_msg                out   varchar2 );

    procedure update_row ( p_row_id              in out   varchar2,
                           p_rec                 in out   xxss_approval_list%rowtype,
                           p_err_code               out   varchar2,
                           p_err_msg                out   varchar2 );
    
    procedure delete_row ( p_row_id              in out   varchar2,
                           p_err_code               out   varchar2,
                           p_err_msg                out   varchar2 );   

end xxss_approval_list_pkg;