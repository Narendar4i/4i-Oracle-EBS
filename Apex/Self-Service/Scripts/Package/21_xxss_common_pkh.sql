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

    function get_json_data(p_request_id in number,
                           p_item_key   in varchar2)
             return varchar2;

    function get_no_of_days(p_start_date in date,
                            p_end_date   in date)
             return number;
    
    function number_validation (p_value in varchar2)
             return number;
    
    procedure build_dynamic_content ( p_page_no      in number,
                                      p_update_id    in number,
                                      p_request_name in varchar2,
                                      p_clob         out clob                               
                                    );

end xxss_common_pkg;