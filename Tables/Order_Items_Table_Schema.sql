SQL> SELECT DBMS_METADATA.GET_DDL('TABLE','ORDER_ITEMS') FROM DUAL;
                                                                                                                                                                                                        
  CREATE TABLE "SCOTT"."ORDER_ITEMS"                                                                                                                                                                    
   (	"ORDER_ITEM_ID" NUMBER,                                                                                                                                                                            
	"ORDER_ID" NUMBER,                                                                                                                                                                                     
	"PRODUCT_ID" NUMBER,                                                                                                                                                                                   
	"QUANTITY" NUMBER,                                                                                                                                                                                     
	"PRICE" NUMBER(10,2),                                                                                                                                                                                  
	 CHECK (QUANTITY>0) ENABLE,                                                                                                                                                                            
	 PRIMARY KEY ("ORDER_ITEM_ID")                                                                                                                                                                         
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS                                                                                                                                     
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645                                                                                                                                 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)                                                                                                                                      
  TABLESPACE "USERS"  ENABLE,                                                                                                                                                                           
	 CONSTRAINT "FK_ORDERITEM_ORDER" FOREIGN KEY ("ORDER_ID")                                                                                                                                              
	  REFERENCES "SCOTT"."ORDERS" ("ORDER_ID") ENABLE,                                                                                                                                                     
	 CONSTRAINT "FK_ORDERITEM_PRODUCT" FOREIGN KEY ("PRODUCT_ID")                                                                                                                                          
	  REFERENCES "SCOTT"."PRODUCTS" ("PRODUCT_ID") ENABLE                                                                                                                                                  
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING                                                                                                                                   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645                                                                                                                                 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)                                                                                                                                      
  TABLESPACE "USERS"                                                                                                                                                                                    
                                                                                                                                                                                                        
                                                                                                                                                                                                        
SQL> SPOOL OFF;
