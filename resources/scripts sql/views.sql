--------------------------------------------------------
--  File created - Saturday-November-26-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View FRUIT_TAB_CUSTOMER
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "FRUIT"."FRUIT_TAB_CUSTOMER" ("NAME_FRUIT", "IS_PEEL_EDIBLE", "WEIGHT", "VOLUME", "DIMENSION", "RIPENS_LEVEL", "PRICE", "NAME_ALLERGY", "EXPIRATION_DAY") AS 
  SELECT 
    f.name_fruit, 
    f.is_peel_edible, 
    f.weight, f.volume, 
    f.dimension, 
    f.ripens_level, 
    f.price, 
    a.name_allergy, 
    f.date_arrival + fr.days_freshness AS EXPIRATION_DAY
   FROM FRUIT_TAB f
   INNER JOIN FRESHNESS_TAB fr
    ON f.freshness_fk = fr.id_freshness
   INNER JOIN ALLERGY_TAB a
    ON f.allergy_fk = a.id_allergy
   WHERE is_fresh = 'True'
;
--------------------------------------------------------
--  DDL for View OFFER_CUSTOMER_TAB
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "FRUIT"."OFFER_CUSTOMER_TAB" ("ID_OFFER", "DISCOUNTED_PRICE", "DISCOUNTED_WEIGHT", "FRUIT_FK", "STATUS") AS 
  SELECT "ID_OFFER","DISCOUNTED_PRICE","DISCOUNTED_WEIGHT","FRUIT_FK","STATUS" 
FROM OFFER_TAB 
WHERE status = 'ON SALE'
;
--------------------------------------------------------
--  DDL for View USER_OFFER_CUSTOMER_TAB
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "FRUIT"."USER_OFFER_CUSTOMER_TAB" ("ID_OFFER_USER", "FRUIT_NAME", "DISCOUNTED_WEIGHT", "DISCOUNTED_PRICE", "NAME", "SURNAME") AS 
  SELECT
    OU.ID_OFFER_USER,
    O.FRUIT_FK AS FRUIT_NAME,
    O.DISCOUNTED_WEIGHT,
    O.DISCOUNTED_PRICE,
    U.NAME,
    U.SURNAME
    
    FROM OFFER_USER_TAB OU
        INNER JOIN OFFER_TAB O
            ON O.ID_OFFER = OU.OFFER_FK
        INNER JOIN USER_TAB U
            ON U.ID_USER = OU.USER_FK
;
