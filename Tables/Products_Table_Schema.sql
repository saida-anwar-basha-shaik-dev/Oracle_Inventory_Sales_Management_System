SQL> SELECT DBMS_METADATA.GET_DDL('TABLE','PRODUCTS') FROM DUAL;
                                                                                                                                                                                                        
  CREATE TABLE "SCOTT"."PRODUCTS"                                                                                                                                                                       
   (	"PRODUCT_ID" NUMBER,                                                                                                                                                                               
	"PRODUCT_NAME" VARCHAR2(100) NOT NULL ENABLE,                                                                                                                                                          
	"CATEGORY_ID" NUMBER,                                                                                                                                                                                  
	"SUPPLIER_ID" NUMBER,                                                                                                                                                                                  
	"PRICE" NUMBER(10,2),                                                                                                                                                                                  
	"STOCK" NUMBER DEFAULT 0,                                                                                                                                                                              
	 CHECK (PRICE>0) ENABLE,                                                                                                                                                                               
	 CHECK (STOCK>=0) ENABLE,                                                                                                                                                                              
	 PRIMARY KEY ("PRODUCT_ID")                                                                                                                                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS                                                                                                                                     
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645                                                                                                                                 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)                                                                                                                                      
  TABLESPACE "USERS"  ENABLE,                                                                                                                                                                           
	 CONSTRAINT "FK_PRODUCT_CATEGORY" FOREIGN KEY ("CATEGORY_ID")                                                                                                                                          
	  REFERENCES "SCOTT"."CATEGORIES" ("CATEGORY_ID") ENABLE,                                                                                                                                              
	 CONSTRAINT "FK_PRODUCT_SUPPLIER" FOREIGN KEY ("SUPPLIER_ID")                                                                                                                                          
	  REFERENCES "SCOTT"."SUPPLIERS" ("SUPPLIER_ID") ENABLE                                                                                                                                                
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING                                                                                                                                   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645                                                                                                                                 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)                                                                                                                                      
  TABLESPACE "USERS"                                                                                                                                                                                    
                                                                                                                                                                                                        
                                                                                                                                                                                                        
SQL> SPOOL OFF;
