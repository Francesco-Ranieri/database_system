--------------------------------------------------------
--  File created - Sunday-November-27-2022   
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
        IF fruit.weight > 0 AND fruit.is_fresh = 'True'
            THEN
                IF fruit.ripens_level > 0 AND fruit.ripens_level < 0.5 
                    THEN 
                        UPDATE OFFER_TAB 
                            SET 
                                discounted_price = fruit.price - 0.2,
                                discounted_weight = fruit.weight,
                                fruit_fk = fruit.name_fruit,
                                status = 'ON SALE' 
                            where 
                                fruit_fk = fruit.name_fruit
                                AND status = 'ON SALE';
                        IF (sql%notfound)
                            THEN
                                INSERT INTO OFFER_TAB(discounted_price, discounted_weight, fruit_fk)
                                VALUES (fruit.price - 0.2, fruit.weight, fruit.name_fruit);
                        END IF;
                ELSE 
                    IF fruit.ripens_level = 0
                    THEN 
                        UPDATE OFFER_TAB 
                            SET 
                                status = 'REMOVED' 
                            where 
                                fruit_fk = fruit.name_fruit;
                        UPDATE FRUIT_TAB SET is_fresh = 'False' where name_fruit = fruit.name_fruit;
                    END IF;
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
    UPDATE FRUIT_TAB SET weight = weight + 30;
END REFILL_FRUITS;

/
