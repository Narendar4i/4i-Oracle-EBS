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
------------------------------------------------------------------------------------------------------------------
    function get_json_data(p_request_id in number,
                           p_item_key   in varchar2)
             return varchar2
    as
        lc_json      CLOB;
        lj_obj       json_object_t;
        lj_keys      json_key_list;
        lc_key       VARCHAR2(100);
        lc_value     VARCHAR2(4000);

    cursor c_json_data
    is
        select request_info
        from   xxss_requests_v
        where  request_id = p_request_id;
    begin

        open c_json_data;
        fetch c_json_data into lc_json;
        close c_json_data;

        -- Parse the JSON
        lj_obj := json_object_t.parse(lc_json);

        lc_key   := p_item_key;
        lc_value := lj_obj.get_string(lc_key);

        dbms_output.put_line('Key: ' || lc_key || ', Value: ' || lc_value);

        return lc_value;

    end get_json_data;
------------------------------------------------------------------------------------------------------------------
    function get_no_of_days(p_start_date in date,
                            p_end_date   in date)
             return number
    as

    ln_days number;

    begin
        if p_start_date is null or p_end_date is null then
            apex_error.add_error( p_message  => 'Start date and end date cannot be null.',
                                  p_display_location => apex_error.c_inline_in_notification
                              );
        end if;

        ln_days := p_end_date - p_start_date;

        if ln_days < 0 then
            apex_error.add_error( p_message  => 'End date cannot be earlier than start date.',
                                  p_display_location => apex_error.c_inline_in_notification
                              );
        end if;

        return ln_days;

    exception
    when others then
            apex_error.add_error( p_message  => 'An error occurred while calculating the number of days: ' || sqlerrm,
                                  p_display_location => apex_error.c_inline_in_notification
                              );
            return null;
    end get_no_of_days;
----------------------------------------------------------------------------------------------------------------------------------
    function number_validation (p_value  in varchar2)
             return number
    as

    ln_num number;

    begin
        ln_num := to_number(p_value);
        
        -- Check if the number is non-negative
        if ln_num >= 0 then
           return 1;
        else
           return 0;
        end if;

    exception
        when value_error then
            return 0;
        when others then
            return 0;
    end number_validation;
------------------------------------------------------------------------------------------------------------------------------------
    procedure build_dynamic_content ( p_page_no      in number,
                                      p_update_id    in number,
                                      p_request_name in varchar2,
                                      p_clob         out clob                                  
    ) as
    
    lc_item_name     varchar2(100);
    lc_value         varchar2(4000);
    
    lc_label_style   constant varchar2(200) := 'font-weight:bold; min-width:150px; margin:5px 10px 10px 0;';
    lc_input_style   constant varchar2(100) := 'margin-bottom:8px; width:150px;';
    lc_required_span constant varchar2(100) := '<span style="color:red;">*</span>';
    ln_text_idx      number   := 1;
    ln_select_idx    number   := 1;
    ln_date_idx      number   := 1;

    cursor cur_requestitem(p_request_name varchar2) 
    is
    select xrdv.rd_id,
           xrdv.req_id,
           xrdv.rd_seq_num,
           xrdv.rd_datatype            as rd_datatype,
           initcap(xrdv.rd_item)       as rd_item,
           xrdv.rd_lookup_type         as rd_lookup_type,
           case when xrdv.rd_lookup_type is null 
                then 'No'
                else 'Yes'
           end                         as lov_yes_no,
           decode(xrdv.rd_mandatory_yn, 'Y', 'Yes', 'N', 'No', 'Yes') as field_mandatory_yes_no,
           xrdv.attribute_category,
           xrdv.attribute1,
           xrdv.attribute2,
           xrdv.attribute3,
           xrdv.attribute4,
           xrdv.attribute5
    from   xxss_request_info_v xrdv
    where  upper(xrdv.req_name) = upper(p_request_name)
    and    xrdv.rd_display_yn = 'Y';

    begin
        xx_debug('Inside a request dynamic content p4: '||p_request_name );

        p_clob := '<div style="border:0.5px solid grey; border-radius:10px; padding:20px; margin:15px 0;">';

        for item in cur_requestitem(p_request_name) 
        loop
        
            lc_value     := null;
            lc_item_name := 'P' || to_char(p_page_no) || '_ITEM_' || replace(upper(item.rd_item), ' ', '_');

            xx_debug('Update Request ID : '|| p_update_id);

            begin
                select xxss_common_pkg.get_json_data(request_id, initcap(xrdv.rd_item)) value
                into   lc_value
                from   xxss_requests_v xrv,
                       xxss_request_details_v xrdv
                where  xrv.req_id = xrdv.req_id
                and    request_id = p_update_id
                and    initcap(xrdv.rd_item) = item.rd_item ;

                xx_debug('Update Dynamic Content PageItem : '||lc_item_name||' and value :'||lc_value);
            exception
                when others then
                     lc_value :=  null;
            end;

            if item.rd_datatype = 'Char' then
            
                xx_debug('Dynamic Content Char PageItem : '||lc_item_name);
                
                p_clob := p_clob ||
                   '<div style="display:flex; align-items:center; margin-bottom:15px;">' ||
                       '<label for="' || lc_item_name || '" style="' || lc_label_style || '">' ||
                       case when item.field_mandatory_yes_no = 'Yes' then lc_required_span else '' end || item.rd_item ||
                       '</label>' ||
                       apex_item.text(
                           p_idx        => ln_text_idx,
                           p_value      => lc_value,
                           p_size       => 15,
                           p_attributes => 'style="' || lc_input_style,
                           p_item_id    => lc_item_name
                       ) ||
                   '</div>';

            elsif item.rd_datatype = 'Short Text' then
            
                xx_debug('Dynamic Content Short Text PageItem : '||lc_item_name);
                
                if item.lov_yes_no = 'No' then
                    p_clob := p_clob ||
                      '<div style="display:flex; align-items:center; margin-bottom:15px;">' ||
                          '<label for="' || lc_item_name || '" style="' || lc_label_style || '">' ||
                          case when item.field_mandatory_yes_no = 'Yes' then lc_required_span else '' end || item.rd_item ||
                          '</label>' ||
                          apex_item.text(
                              p_idx        => ln_text_idx,
                              p_value      => lc_value,
                              p_size       => 20,         
                              p_maxlength  => 100,
                              p_attributes => 'style="' || lc_input_style || '"',
                              p_item_id    => lc_item_name
                          ) ||
                      '</div>';
                else
                    p_clob := p_clob ||
                      '<div style="display:flex; align-items:center; margin-bottom:15px;">' ||
                          '<label for="' || lc_item_name || '" style="' || lc_label_style || '">' ||
                          case when item.field_mandatory_yes_no = 'Yes' then lc_required_span else '' end || item.rd_item ||
                          '</label>' ||
                           apex_item.select_list_from_query(
                                p_idx         => ln_select_idx,
                                p_value       => lc_value,
                                p_query       => 'SELECT meaning d, meaning r FROM fnd_lookup_values WHERE lookup_type = ''' || item.rd_lookup_type || ''' AND enabled_flag = ''Y'' ORDER BY meaning',
                                p_attributes  => 'style="width:150px;margin-bottom:10px"',
                                p_show_null   => 'NO',
                                p_item_id     => lc_item_name
                           ) ||
                      '</div>';
                end if;

            elsif item.rd_datatype = 'Long Text' then
            
                xx_debug('Dynamic Content Short Text PageItem : '||lc_item_name);
                
                p_clob := p_clob ||
                   '<div style="display:flex; align-items:center; margin-bottom:15px;">' ||
                       '<label for="' || lc_item_name || '" style="' || lc_label_style || '">' ||
                       case when item.field_mandatory_yes_no = 'Yes' then lc_required_span else '' end || item.rd_item ||
                       '</label>' ||
                       apex_item.textarea(
                           p_idx        => ln_text_idx,
                           p_value      => lc_value,
                           p_rows       => 2,          
                           p_cols       => 30,
                           p_item_id    => lc_item_name
                       ) ||
                   '</div>';

            elsif item.rd_datatype = 'Date' then
            
                xx_debug('Dynamic Content Date PageItem : '||lc_item_name);
                
                p_clob := p_clob ||
                    '<div style="display:flex; align-items:center; margin-bottom:12px;">' ||
                        '<label for="' || lc_item_name || '" style="' || lc_label_style || '">' ||
                        case when item.field_mandatory_yes_no = 'Yes' then lc_required_span else '' end || item.rd_item ||
                        '</label>' ||
                       apex_item.date_popup(
                           p_idx          => ln_date_idx, 
                           p_value        => to_date(lc_value, 'DD-MON-YYYY'),
                           p_date_format  => 'DD-MON-YYYY',
                           p_size         => 15,        
                           p_maxlength    => 11 ,
                           p_item_id      => lc_item_name
                       ) ||
                    '</div>';   

            elsif item.rd_datatype = 'Number' then
            
                xx_debug('Dynamic Content Number PageItem : '||lc_item_name);
                
                p_clob := p_clob ||
                   '<div style="display:flex; align-items:center; margin-bottom:12px;">' ||
                     '<label for="' || lc_item_name || '" style="' || lc_label_style || '">' ||
                       case when item.field_mandatory_yes_no = 'Yes' then lc_required_span else '' end || item.rd_item ||
                     '</label>' ||
                        apex_item.text(
                           p_idx        => ln_text_idx,
                           p_value      => lc_value,
                           p_size       => 3,
                           p_maxlength  => 10,
                           p_attributes => 'style="' || lc_input_style || '" type="number" step="any" min="0"',
                           p_item_id    => lc_item_name
                         ) ||
                '</div>';
            end if;
        end loop;
    end build_dynamic_content;

end xxss_common_pkg;