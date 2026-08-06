SQL> SELECT DBMS_METADATA.GET_DDL('TABLE','PURCHASES') FROM DUAL;
                                                                                                                                                                                                        
  CREATE TABLE "SCOTT"."PURCHASES"                                                                                                                                                                      
   (	"PURCHASE_ID" NUMBER,                                                                                                                                                                              
	"SUPPLIER_ID" NUMBER,                                                                                                                                                                                  
	"PRODUCT_ID" NUMBER,                                                                                                                                                                                   
	"QUANTITY" NUMBER,                                                                                                                                                                                     
	"PURCHASE_DATE" DATE DEFAULT SYSDATE,                                                                                                                                                                  
	 CHECK (QUANTITY>0) ENABLE,                                                                                                                                                                            
	 PRIMARY KEY ("PURCHASE_ID")                                                                                                                                                                           
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS                                                                                                                                     
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645                                                                                                                                 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)                                                                                                                                      
  TABLESPACE "USERS"  ENABLE,                                                                                                                                                                           
	 CONSTRAINT "FK_PURCHASE_SUPPLIER" FOREIGN KEY ("SUPPLIER_ID")                                                                                                                                         
	  REFERENCES "SCOTT"."SUPPLIERS" ("SUPPLIER_ID") ENABLE,                                                                                                                                               
	 CONSTRAINT "FK_PURCHASE_PRODUCT" FOREIGN KEY ("PRODUCT_ID")                                                                                                                                           
	  REFERENCES "SCOTT"."PRODUCTS" ("PRODUCT_ID") ENABLE                                                                                                                                                  
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING                                                                                                                                   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645                                                                                                                                 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)                                                                                                                                      
  TABLESPACE "USERS"                                                                                                                                                                                    
                                                                                                                                                                                                        
                                                                                                                                                                                                        
SQL> SPOOL OFF;
