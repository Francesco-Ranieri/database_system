--------------------------------------------------------
--  File created - Saturday-November-26-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure FRESHNESS_CHECK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FRUIT"."FRESHNESS_CHECK" AS  

    CURSOR C IS 
        SELECT * FROM FRUIT_TAB F
        INNER JOIN FRESHNESS_TAB FR
        ON F.FRESHNESS_FK = FR.ID_FRESHNESS;

BEGIN
    FOR info IN c LOOP
        IF (info.date_arrival + info.days_freshness) < to_date(CURRENT_DATE)
            THEN 
                dbms_output.put_line (info.name_fruit || ' EXPIRED');
                UPDATE FRUIT_TAB 
                SET IS_FRESH='False' 
                WHERE name_fruit = info.name_fruit;
        END IF;
    END LOOP;
END;

/
--------------------------------------------------------
--  DDL for Procedure FRESHNESS_DECAY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FRUIT"."FRESHNESS_DECAY" AS 

    CURSOR C IS 
        SELECT * FROM FRUIT_TAB;

BEGIN
    FOR fruit IN C LOOP
        IF fruit.ripens_level > 0
        THEN   
             UPDATE FRUIT_TAB SET RIPENS_LEVEL = RIPENS_LEVEL - 0.1 WHERE name_fruit = fruit.name_fruit;
        END IF;
    END LOOP;
END;

/
--------------------------------------------------------
--  DDL for Procedure OFFER_LOW_RIPENS_LEVEL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FRUIT"."OFFER_LOW_RIPENS_LEVEL" AS 
    CURSOR C IS 
        SELECT * FROM FRUIT_TAB;
BEGIN
    FOR fruit IN c LOOP
        IF fruit.ripens_level > 0 AND fruit.ripens_level < 0.5 
            THEN 
                DELETE FROM OFFER_TAB where 
                    fruit_fk = fruit.name_fruit;
                INSERT INTO OFFER_TAB O1 (discounted_price, discounted_weight, fruit_fk, status)
                VALUES (fruit.price - 0.2, fruit.weight, fruit.name_fruit, 'ON SALE');
        ELSE 
            IF fruit.ripens_level = 0
            THEN 
                DELETE FROM OFFER_TAB O2 WHERE O2.fruit_fk = fruit.name_fruit;
                UPDATE FRUIT_TAB SET is_fresh = 'False' where name_fruit = fruit.name_fruit;
            END IF;
        END IF;
    END LOOP;
END;

/
--------------------------------------------------------
--  DDL for Procedure REFILL_FRUITS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "FRUIT"."REFILL_FRUITS" AS 

BEGIN
    UPDATE FRUIT_TAB SET weight = weight + 10;
END REFILL_FRUITS;

/
