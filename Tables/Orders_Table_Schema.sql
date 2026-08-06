SQL> SELECT DBMS_METADATA.GET_DDL('TABLE','ORDERS') FROM DUAL;
                                                                                                                                                                                                        
  CREATE TABLE "SCOTT"."ORDERS"                                                                                                                                                                         
   (	"ORDER_ID" NUMBER,                                                                                                                                                                                 
	"CUSTOMER_ID" NUMBER,                                                                                                                                                                                  
	"EMP_ID" NUMBER,                                                                                                                                                                                       
	"ORDER_DATE" DATE DEFAULT SYSDATE,                                                                                                                                                                     
	"STATUS" VARCHAR2(20),                                                                                                                                                                                 
	 PRIMARY KEY ("ORDER_ID")                                                                                                                                                                              
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS                                                                                                                                     
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645                                                                                                                                 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)                                                                                                                                      
  TABLESPACE "USERS"  ENABLE,                                                                                                                                                                           
	 CONSTRAINT "FK_ORDER_CUSTOMER" FOREIGN KEY ("CUSTOMER_ID")                                                                                                                                            
	  REFERENCES "SCOTT"."CUSTOMERS" ("CUSTOMER_ID") ENABLE,                                                                                                                                               
	 CONSTRAINT "FK_ORDER_EMPLOYEE" FOREIGN KEY ("EMP_ID")                                                                                                                                                 
	  REFERENCES "SCOTT"."EMPLOYEES" ("EMP_ID") ENABLE                                                                                                                                                     
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING                                                                                                                                   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645                                                                                                                                 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)                                                                                                                                      
  TABLESPACE "USERS"                                                                                                                                                                                    
                                                                                                                                                                                                        
                                                                                                                                                                                                        
SQL> SPOOL OFF;
