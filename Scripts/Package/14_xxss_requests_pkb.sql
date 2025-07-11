create or replace package body xxss_requests_pkg
as
/***
-- ====================================================================================
-- NAME...:  xxss_requests_pkb.sql
--
-- DESC...:  Package Body, to insert, update, delete and select records from
--           xss_requests table.
--
-- HISTORY:
--
-- Version  WHO              WHAT                                         WHEN
-- -------  ---------------  -------------------------------------------- ------------
-- s1.0     Narendar-4iApps  Initial File                                 10-Jul-2025
-- ====================================================================================
***/
    procedure insert_row ( p_row_id              in out   varchar2,
                           p_rec                 in out   xxss_requests%rowtype,
                           p_err_code               out   varchar2,
                           p_err_msg                out   varchar2 ) is

      reqd_value_missing   exception;
      m_crnt_param         varchar2 (50);
      m_created_date       date;
      m_rowid              varchar2 (50);
      m_count              number;

      cursor c_res_rowid
      is
        select rowid
        from   xxss_requests
        where  req_id = p_rec.req_id;

    begin
      p_err_code     := '0';
      p_err_msg      := 'success';
      m_created_date := sysdate;

      m_crnt_param   := 'request_num';
      if p_rec.request_num is null then
         raise reqd_value_missing;
      end if;
      
      m_crnt_param   := 'request_date';
      if p_rec.request_date is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'req_id';
      if p_rec.req_id is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'user_id';
      if p_rec.user_id is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'person_id';
      if p_rec.person_id is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'org_id';
      if p_rec.org_id is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'request_info';
      if p_rec.request_info is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'created_by';
      if p_rec.created_by is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'creation_date';
      if p_rec.creation_date is null then
         p_rec.creation_date := m_created_date;
      end if;

      m_crnt_param   := 'last_updated_by';
      if p_rec.last_updated_by is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'last_update_date';
      if p_rec.last_update_date is null then
         p_rec.last_update_date := m_created_date;
      end if;

      m_crnt_param   := '';

      insert into xxss_requests values p_rec;

      -- commit;

      open c_res_rowid;
      fetch c_res_rowid into p_row_id;
      if (c_res_rowid%notfound) then
         close c_res_rowid;
         raise no_data_found;
      end if;
      close c_res_rowid;

    exception
      when reqd_value_missing then
         p_err_code := '-99999';
         p_err_msg := 'required value missing.... ' || m_crnt_param;
         return;
      when others then
         p_err_code := sqlcode;
         p_err_msg := substr (sqlerrm, 1, 2000);
         return;
    end insert_row;
----------------------------------------------------------------------------------------------
    procedure update_row ( p_row_id              in out   varchar2,
                           p_rec                 in out   xxss_requests%rowtype,
                           p_err_code               out   varchar2,
                           p_err_msg                out   varchar2 ) is

      m_rowid              varchar2 (50);
      m_count              number;
      reqd_value_missing   exception;
      m_crnt_param         varchar2 (20);
      m_created_date       date;

    begin
      p_err_code     := '0';
      p_err_msg      := 'success';
      m_created_date := sysdate;

      m_crnt_param   := 'request_num';
      if p_rec.request_num is null then
         raise reqd_value_missing;
      end if;
      
      m_crnt_param   := 'request_date';
      if p_rec.request_date is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'req_id';
      if p_rec.req_id is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'user_id';
      if p_rec.user_id is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'person_id';
      if p_rec.person_id is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'org_id';
      if p_rec.org_id is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'request_info';
      if p_rec.request_info is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'created_by';
      if p_rec.created_by is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'creation_date';
      if p_rec.creation_date is null then
         p_rec.creation_date := m_created_date;
      end if;

      m_crnt_param   := 'last_updated_by';
      if p_rec.last_updated_by is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'last_update_date';
      if p_rec.last_update_date is null then
         p_rec.last_update_date := m_created_date;
      end if;

      m_crnt_param   := '';

      update xxss_requests
         set request_id          = p_rec.request_id,
             req_id              = p_rec.req_id,
             request_num         = p_rec.request_num,
             request_date        = p_rec.request_date,
             user_id             = p_rec.user_id,
             person_id           = p_rec.person_id,
             org_id              = p_rec.org_id,
             request_info        = p_rec.request_info,
             request_description = p_rec.request_description,
             request_status      = p_rec.request_status,
             wf_item_type        = p_rec.wf_item_type,
             wf_item_key         = p_rec.wf_item_key,
             wf_process_name     = p_rec.wf_process_name,
             flow_with           = p_rec.flow_with,
             attribute_category  = p_rec.attribute_category,
             attribute1          = p_rec.attribute1,
             attribute2          = p_rec.attribute2,
			 attribute3          = p_rec.attribute3,
		     attribute4          = p_rec.attribute4,
	  	     attribute5          = p_rec.attribute5,
             created_by          = p_rec.created_by,
             creation_date       = p_rec.creation_date,
             last_updated_by     = p_rec.last_updated_by,
             last_update_date    = p_rec.last_update_date,
             last_update_login   = p_rec.last_update_login
       where rowid = p_row_id;

      if (sql%rowcount = 0) then
         raise no_data_found;
      end if;

      commit;

   exception
      when reqd_value_missing then
         p_err_code := '-99999';
         p_err_msg := 'required value missing.... ' || m_crnt_param;
         return;
      when others then
         p_err_code := sqlcode;
         p_err_msg := substr (sqlerrm, 1, 2000);
         return;
   end update_row;
---------------------------------------------------------------------------------------------------------
   procedure delete_row ( p_row_id     in out   varchar2,
                          p_err_code      out   varchar2,
                          p_err_msg       out   varchar2 ) is
   begin
      p_err_code := '0';
      p_err_msg := 'success';

      delete from xxss_requests
      where rowid = p_row_id;

      commit;
   exception
      when others then
         p_err_code := sqlcode;
         p_err_msg := substr (sqlerrm, 1, 2000);
         return;
   end delete_row;

end xxss_requests_pkg;
/