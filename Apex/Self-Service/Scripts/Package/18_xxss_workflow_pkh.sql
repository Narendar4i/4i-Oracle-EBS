create or replace package xxss_workflow_pkg
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

   procedure initiate_workflow(p_request_id in number);

   procedure set_attributes(p_itemtype    in  varchar2 ,
                            p_itemkey     in  varchar2 ,
                            p_actid       in  number   ,
                            p_funcmode    in  varchar2 ,
                            x_resultout   out varchar2
                           );

end xxss_workflow_pkg;
