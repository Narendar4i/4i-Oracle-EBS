create or replace package body xxss_workflow_pkg
as
/***
-- =================================================================================================
-- NAME...:  xxss_workflow_pkg.sql
--
-- DESC...:  Package specification for workflow-related procedures.
--           This package contains procedures to initiate workflows for various requests.
-- HISTORY: 
-- 
-- Version  WHO              WHAT                                         WHEN
-- -------  ---------------  -------------------------------------------- ------------
-- s1.0     Narendar-4iApps  Initial File                                 11-Aug-2025
-- =================================================================================================
***/

    procedure initiate_workflow(p_request_id in number)
    as
     
        lc_itemtype      varchar2(30);
        lc_itemkey       varchar2(30);
        lc_process_name  varchar2(30);
        lc_item_owner    varchar2(30) := 'SYSADMIN';
        ln_debug_info    number;
    
    begin
      
     xx_debug('xxss_workflow_pkg.initiate_workflow'|| p_request_id);
     
     lc_itemtype     := 'XXSSR';
     lc_itemkey      := to_char(p_request_id)||'-'||xxss_wf_itemkey_s.nextval;
     lc_process_name := 'XXSS_REQUEST_PROCESS';
     ln_debug_info   := 1;

     wf_engine.createprocess( lc_itemtype , lc_itemkey , lc_process_name );
     wf_engine.setitemowner ( lc_itemtype , lc_itemkey , lc_item_owner   );
     wf_engine.startprocess ( lc_itemtype , lc_itemkey);
     
     xx_debug('Workflow initiated successfully for request ID: ' || p_request_id);

    exception
    when others then
        wf_core.context ('xxss_workflow_pkg','initiate_workflow',lc_itemtype,lc_itemkey,ln_debug_info);
    end initiate_workflow;
---------------------------------------------------------------------------------------------------------------------------------------------
    procedure set_attributes(p_itemtype    in  varchar2 ,
                             p_itemkey     in  varchar2 ,
                             p_actid       in  number   ,
                             p_funcmode    in  varchar2 ,
                             x_resultout   out varchar2)
    as
        lc_requestor   varchar2(30);
        ln_debug_info  number;

    cursor cur_requestor 
    is
       select fu.user_name
       from   xxss_requests_v xrv,
              fnd_user fu
       where  xrv.user_id = fu.user_id
       and    request_id  = substr(p_itemkey , 1 , instr(p_itemkey , '-')-1);
    begin
        
        ln_debug_info := 1;

        open  cur_requestor;
        fetch cur_requestor into lc_requestor;
        if    cur_requestor%notfound then
              ln_debug_info := 2;
        end if;
        close cur_requestor;

        xx_debug('xxss_workflow_pkg.set_attributes' || p_itemtype || ', item key: ' || p_itemkey);
        wf_engine.setitemattrtext(p_itemtype, p_itemkey, 'REQUESTOR', lc_requestor);

    exception 
    when others then    
        wf_core.context ('xxss_workflow_pkg','set_attributes',p_itemtype,p_itemkey,ln_debug_info);
    end set_attributes;
---------------------------------------------------------------------------------------------------------------------------------------------

end xxss_workflow_pkg;
