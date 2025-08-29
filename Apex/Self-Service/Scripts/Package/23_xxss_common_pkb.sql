create or replace package body xxss_common_pkg
as
/***
-- =================================================================================================
-- NAME...:  xxss_common_pkb.sql
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
                               p_emp_num  out varchar2)
    as
        lc_emp_name varchar2(100);
        lc_emp_num  varchar2(100);
    
    cursor cur_emp is
       select full_name,
              employee_number
       from   per_all_people_f  papf,
              fnd_user          fu
       where  papf.person_id = fu.employee_id
       and    trunc(sysdate) between papf.effective_start_date and papf.effective_end_date
       and    fu.user_id     = p_user_id;

    begin
        
        open  cur_emp;
        fetch cur_emp into lc_emp_name, lc_emp_num;
        if cur_emp%notfound then
            raise_application_error(-20001, 'No employee found for the given user ID.');
        end if;
        close cur_emp;

        p_emp_name := lc_emp_name;
        p_emp_num  := lc_emp_num;

    exception
        when others then
            if cur_emp%isopen then
                close cur_emp;
            end if;
            raise_application_error(-20002, 'An error occurred while fetching employee details: ' || sqlerrm);
    
    end get_current_user;

end xxss_common_pkg;