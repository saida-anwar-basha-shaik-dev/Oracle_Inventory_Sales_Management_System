SQL> SELECT DBMS_METADATA.GET_DDL('VIEW','COMPLETE_INVENTORY_SALES_VIEW') FROM DUAL;
                                                                                                                                                                                                        
  CREATE OR REPLACE FORCE VIEW "SCOTT"."COMPLETE_INVENTORY_SALES_VIEW" ("CUSTOME                                                                                                                        
R_ID", "CUSTOMER_NAME", "PHONE", "EMAIL", "ADDRESS", "CITY", "ORDER_ID", "ORDER_                                                                                                                        
DATE", "STATUS", "EMP_ID", "EMP_NAME", "DESIGNATION", "ORDER_ITEM_ID", "QUANTITY                                                                                                                        
", "PRICE", "TOTAL_PRICE", "PRODUCT_ID", "PRODUCT_NAME", "STOCK", "CATEGORY_ID",                                                                                                                        
 "CATEGORY_NAME", "SUPPLIER_ID", "SUPPLIER_NAME", "PAYMENT_ID", "PAYMENT_MODE",                                                                                                                         
"PAYMENT_DATE", "AMOUNT", "PURCHASE_ID", "PURCHASE_QUANTITY", "PURCHASE_DATE", "                                                                                                                        
LOG_ID", "OLD_STOCK", "NEW_STOCK", "UPDATED_DATE") AS                                                                                                                                                   
  SELECT                                                                                                                                                                                                
    C.CUSTOMER_ID,                                                                                                                                                                                      
    C.CUSTOMER_NAME,                                                                                                                                                                                    
    C.PHONE,                                                                                                                                                                                            
    C.EMAIL,                                                                                                                                                                                            
    C.ADDRESS,                                                                                                                                                                                          
    C.CITY,                                                                                                                                                                                             
    O.ORDER_ID,                                                                                                                                                                                         
    O.ORDER_DATE,                                                                                                                                                                                       
    O.STATUS,                                                                                                                                                                                           
    E.EMP_ID,                                                                                                                                                                                           
    E.EMP_NAME,                                                                                                                                                                                         
    E.DESIGNATION,                                                                                                                                                                                      
    OI.ORDER_ITEM_ID,                                                                                                                                                                                   
    OI.QUANTITY,                                                                                                                                                                                        
    OI.PRICE,                                                                                                                                                                                           
    (OI.QUANTITY * OI.PRICE) AS TOTAL_PRICE,                                                                                                                                                            
    P.PRODUCT_ID,                                                                                                                                                                                       
    P.PRODUCT_NAME,                                                                                                                                                                                     
    P.STOCK,                                                                                                                                                                                            
    CAT.CATEGORY_ID,                                                                                                                                                                                    
    CAT.CATEGORY_NAME,                                                                                                                                                                                  
    S.SUPPLIER_ID,                                                                                                                                                                                      
    S.SUPPLIER_NAME,                                                                                                                                                                                    
    PAY.PAYMENT_ID,                                                                                                                                                                                     
    PAY.PAYMENT_MODE,                                                                                                                                                                                   
    PAY.PAYMENT_DATE,                                                                                                                                                                                   
    PAY.AMOUNT,                                                                                                                                                                                         
    PU.PURCHASE_ID,                                                                                                                                                                                     
    PU.QUANTITY AS PURCHASE_QUANTITY,                                                                                                                                                                   
    PU.PURCHASE_DATE,                                                                                                                                                                                   
    I.LOG_ID,                                                                                                                                                                                           
    I.OLD_STOCK,                                                                                                                                                                                        
    I.NEW_STOCK,                                                                                                                                                                                        
    I.UPDATED_DATE                                                                                                                                                                                      
FROM CUSTOMERS C                                                                                                                                                                                        
JOIN ORDERS O                                                                                                                                                                                           
    ON C.CUSTOMER_ID = O.CUSTOMER_ID                                                                                                                                                                    
JOIN EMPLOYEES E                                                                                                                                                                                        
    ON O.EMP_ID = E.EMP_ID                                                                                                                                                                              
JOIN ORDER_ITEMS OI                                                                                                                                                                                     
    ON O.ORDER_ID = OI.ORDER_ID                                                                                                                                                                         
JOIN PRODUCTS P                                                                                                                                                                                         
    ON OI.PRODUCT_ID = P.PRODUCT_ID                                                                                                                                                                     
JOIN CATEGORIES CAT                                                                                                                                                                                     
    ON P.CATEGORY_ID = CAT.CATEGORY_ID                                                                                                                                                                  
JOIN SUPPLIERS S                                                                                                                                                                                        
    ON P.SUPPLIER_ID = S.SUPPLIER_ID                                                                                                                                                                    
JOIN PAYMENTS PAY                                                                                                                                                                                       
    ON O.ORDER_ID = PAY.ORDER_ID                                                                                                                                                                        
JOIN PURCHASES PU                                                                                                                                                                                       
    ON P.PRODUCT_ID = PU.PRODUCT_ID                                                                                                                                                                     
   AND S.SUPPLIER_ID = PU.SUPPLIER_ID                                                                                                                                                                   
JOIN INVENTORY_LOG I                                                                                                                                                                                    
    ON P.PRODUCT_ID = I.PRODUCT_ID                                                                                                                                                                      
                                                                                                                                                                                                        
                                                                                                                                                                                                        
SQL> SPOOL OFF;
