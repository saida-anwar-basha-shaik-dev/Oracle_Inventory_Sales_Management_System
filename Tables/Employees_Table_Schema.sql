SQL> SELECT DBMS_METADATA.GET_DDL('TABLE','EMPLOYEES') FROM DUAL;
                                                                                                                                                                                                        
  CREATE TABLE "SCOTT"."EMPLOYEES"                                                                                                                                                                      
   (	"EMP_ID" NUMBER,                                                                                                                                                                                   
	"EMP_NAME" VARCHAR2(50) NOT NULL ENABLE,                                                                                                                                                               
	"DESIGNATION" VARCHAR2(30),                                                                                                                                                                            
	"SALARY" NUMBER(10,2),                                                                                                                                                                                 
	 CHECK (SALARY>0) ENABLE,                                                                                                                                                                              
	 PRIMARY KEY ("EMP_ID")                                                                                                                                                                                
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS                                                                                                                                     
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645                                                                                                                                 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)                                                                                                                                      
  TABLESPACE "USERS"  ENABLE                                                                                                                                                                            
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING                                                                                                                                   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645                                                                                                                                 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)                                                                                                                                      
  TABLESPACE "USERS"                                                                                                                                                                                    
                                                                                                                                                                                                        
                                                                                                                                                                                                        
SQL> SPOOL OFF;
