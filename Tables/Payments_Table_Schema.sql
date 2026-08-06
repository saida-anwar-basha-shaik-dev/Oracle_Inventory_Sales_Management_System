SQL> SELECT DBMS_METADATA.GET_DDL('TABLE','PAYMENTS') FROM DUAL;
                                                                                                                                                                                                        
  CREATE TABLE "SCOTT"."PAYMENTS"                                                                                                                                                                       
   (	"PAYMENT_ID" NUMBER,                                                                                                                                                                               
	"ORDER_ID" NUMBER,                                                                                                                                                                                     
	"PAYMENT_MODE" VARCHAR2(20),                                                                                                                                                                           
	"PAYMENT_DATE" DATE DEFAULT SYSDATE,                                                                                                                                                                   
	"AMOUNT" NUMBER(10,2),                                                                                                                                                                                 
	 PRIMARY KEY ("PAYMENT_ID")                                                                                                                                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS                                                                                                                                     
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645                                                                                                                                 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)                                                                                                                                      
  TABLESPACE "USERS"  ENABLE,                                                                                                                                                                           
	 CONSTRAINT "FK_PAYMENT_ORDER" FOREIGN KEY ("ORDER_ID")                                                                                                                                                
	  REFERENCES "SCOTT"."ORDERS" ("ORDER_ID") ENABLE                                                                                                                                                      
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING                                                                                                                                   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645                                                                                                                                 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)                                                                                                                                      
  TABLESPACE "USERS"                                                                                                                                                                                    
                                                                                                                                                                                                        
                                                                                                                                                                                                        
SQL> SPOOL OFF;
