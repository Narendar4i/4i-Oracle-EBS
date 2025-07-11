create or replace package body xxss_request_details_pkg
as
/***
-- ====================================================================================
-- NAME...:  xxss_request_details_pkb.sql
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
                           p_err_msg                out   varchar2 ) is

      reqd_value_missing   exception;
      m_crnt_param         varchar2 (50);
      m_created_date       date;
      m_rowid              varchar2 (50);
      m_count              number;

      cursor c_res_rowid
      is
        select rowid
        from   xxss_request_details
        where  req_id = p_rec.req_id;

    begin
      p_err_code     := '0';
      p_err_msg      := 'success';
      m_created_date := sysdate;

      m_crnt_param   := 'rd_id';
      if p_rec.rd_id is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'req_id';
      if p_rec.req_id is null then
         raise reqd_value_missing;
      end if;
      
      m_crnt_param   := 'rd_seq_num';
      if p_rec.rd_seq_num is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'rd_datatype';
      if p_rec.rd_datatype is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'rd_item';
      if p_rec.rd_item is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'rd_lookup_type';
      if p_rec.rd_lookup_type is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'rd_mandatory_yn';
      if p_rec.rd_mandatory_yn is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'rd_display_yn';
      if p_rec.rd_display_yn is null then
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

      insert into xxss_request_details values p_rec;

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
                           p_rec                 in out   xxss_request_details%rowtype,
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

      m_crnt_param   := 'rd_id';
      if p_rec.rd_id is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'req_id';
      if p_rec.req_id is null then
         raise reqd_value_missing;
      end if;
      
      m_crnt_param   := 'rd_seq_num';
      if p_rec.rd_seq_num is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'rd_datatype';
      if p_rec.rd_datatype is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'rd_item';
      if p_rec.rd_item is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'rd_lookup_type';
      if p_rec.rd_lookup_type is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'rd_mandatory_yn';
      if p_rec.rd_mandatory_yn is null then
         raise reqd_value_missing;
      end if;

      m_crnt_param   := 'rd_display_yn';
      if p_rec.rd_display_yn is null then
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

      update xxss_request_details
         set rd_id                = p_rec.rd_id,
             req_id               = p_rec.req_id,
             rd_seq_num           = p_rec.rd_seq_num,
             rd_datatype          = p_rec.rd_datatype,
             rd_item              = p_rec.rd_item,
             rd_lookup_type       = p_rec.rd_lookup_type,
             rd_mandatory_yn      = p_rec.rd_mandatory_yn,
             rd_display_yn        = p_rec.rd_display_yn,
             attribute_category   = p_rec.attribute_category,
             attribute1           = p_rec.attribute1,
             attribute2           = p_rec.attribute2,
			 attribute3           = p_rec.attribute3,
		     attribute4           = p_rec.attribute4,
	  	     attribute5           = p_rec.attribute5,
             created_by           = p_rec.created_by,
             creation_date        = p_rec.creation_date,
             last_updated_by      = p_rec.last_updated_by,
             last_update_date     = p_rec.last_update_date,
             last_update_login    = p_rec.last_update_login
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

      delete from xxss_request_details
      where rowid = p_row_id;

      commit;
   exception
      when others then
         p_err_code := sqlcode;
         p_err_msg := substr (sqlerrm, 1, 2000);
         return;
   end delete_row;

end xxss_request_details_pkg;
/