SQL> SELECT DBMS_METADATA.GET_DDL('TABLE','INVENTORY_LOG') FROM DUAL;
                                                                                                                                                                                                        
  CREATE TABLE "SCOTT"."INVENTORY_LOG"                                                                                                                                                                  
   (	"LOG_ID" NUMBER,                                                                                                                                                                                   
	"PRODUCT_ID" NUMBER,                                                                                                                                                                                   
	"OLD_STOCK" NUMBER,                                                                                                                                                                                    
	"NEW_STOCK" NUMBER,                                                                                                                                                                                    
	"UPDATED_DATE" DATE DEFAULT SYSDATE,                                                                                                                                                                   
	 PRIMARY KEY ("LOG_ID")                                                                                                                                                                                
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS                                                                                                                                     
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645                                                                                                                                 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)                                                                                                                                      
  TABLESPACE "USERS"  ENABLE,                                                                                                                                                                           
	 CONSTRAINT "FK_LOG_PRODUCT" FOREIGN KEY ("PRODUCT_ID")                                                                                                                                                
	  REFERENCES "SCOTT"."PRODUCTS" ("PRODUCT_ID") ENABLE                                                                                                                                                  
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING                                                                                                                                   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645                                                                                                                                 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)                                                                                                                                      
  TABLESPACE "USERS"                                                                                                                                                                                    
                                                                                                                                                                                                        
                                                                                                                                                                                                        
SQL> SPOOL OFF;
