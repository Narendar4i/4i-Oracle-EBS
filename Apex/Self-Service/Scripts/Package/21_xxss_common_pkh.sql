
create or replace package xxss_common_pkg
as
/***
-- =================================================================================================
-- NAME...:  xxss_common_pkh.sql
--
-- DESC...:  Package Body, to contain common procedures and functions used across the application.
--           This package can be extended to include more common functionalities as needed.
-- HISTORY: 
-- 
-- Version  WHO              WHAT                                         WHEN
-- -------  ---------------  -------------------------------------------- ------------
-- s1.0     Narendar-4iApps  Initial File                                 25-Jul-2025
-- =================================================================================================
***/
    
    -- Procedure to get current user details based on user ID
    -- This procedure retrieves the employee name and number associated with the given user ID.
    procedure get_current_user(p_user_id  in  number,
                               p_emp_name out varchar2,
                               p_emp_num  out varchar2);

end xxss_common_pkg;