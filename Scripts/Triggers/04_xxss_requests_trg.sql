CREATE OR REPLACE TRIGGER XXSS_REQUEST_MASTER_TRG BEFORE
    INSERT OR UPDATE ON XXSS_REQUEST_MASTER
    FOR EACH ROW
BEGIN
    
    IF inserting THEN
		:new.req_id		      := xxss_pk_id_s.NEXTVAL;
        :new.created_by 	  := 0;
        :new.creation_date 	  := localtimestamp;
        :new.last_updated_by  := 0;
        :new.last_update_date := localtimestamp;
    END IF;

    IF updating THEN
        :new.last_updated_by   := 0;
        :new.last_update_date  := localtimestamp;
    END IF;

END;
/
CREATE OR REPLACE TRIGGER XXSS_REQUEST_DETAILS_TRG BEFORE
    INSERT OR UPDATE ON XXSS_REQUEST_DETAILS
    FOR EACH ROW
BEGIN    

    IF inserting THEN
        :new.rd_id		      := xxss_pk1_id_s.NEXTVAL;
        :new.created_by 	  := 0;
        :new.creation_date 	  := localtimestamp;
        :new.last_updated_by  := 0;
        :new.last_update_date := localtimestamp;
        
        -- select max(req_id) 
        -- into :new.req_id
        -- from xxss_request_master;
        
    END IF;

    IF updating THEN
        :new.last_updated_by   := 0;
        :new.last_update_date  := localtimestamp;
    END IF;

END;
/

