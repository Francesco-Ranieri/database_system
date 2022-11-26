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
