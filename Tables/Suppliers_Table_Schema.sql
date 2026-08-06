SQL> SELECT DBMS_METADATA.GET_DDL('TABLE','SUPPLIERS') FROM DUAL;
                                                                                                                                                                                                        
  CREATE TABLE "SCOTT"."SUPPLIERS"                                                                                                                                                                      
   (	"SUPPLIER_ID" NUMBER,                                                                                                                                                                              
	"SUPPLIER_NAME" VARCHAR2(50) NOT NULL ENABLE,                                                                                                                                                          
	"PHONE" VARCHAR2(15),                                                                                                                                                                                  
	"EMAIL" VARCHAR2(100),                                                                                                                                                                                 
	 PRIMARY KEY ("SUPPLIER_ID")                                                                                                                                                                           
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS                                                                                                                                     
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645                                                                                                                                 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)                                                                                                                                      
  TABLESPACE "USERS"  ENABLE,                                                                                                                                                                           
	 UNIQUE ("PHONE")                                                                                                                                                                                      
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS                                                                                                                                     
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645                                                                                                                                 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)                                                                                                                                      
  TABLESPACE "USERS"  ENABLE,                                                                                                                                                                           
	 UNIQUE ("EMAIL")                                                                                                                                                                                      
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS                                                                                                                                     
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645                                                                                                                                 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)                                                                                                                                      
  TABLESPACE "USERS"  ENABLE                                                                                                                                                                            
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING                                                                                                                                   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645                                                                                                                                 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)                                                                                                                                      
  TABLESPACE "USERS"                                                                                                                                                                                    
                                                                                                                                                                                                        
                                                                                                                                                                                                        
SQL> SPOOL OFF;
