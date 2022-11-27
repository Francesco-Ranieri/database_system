--------------------------------------------------------
--  File created - Sunday-November-27-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger CALCULATEPRICE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "FRUIT"."CALCULATEPRICE" 
BEFORE INSERT OR UPDATE ON FRUIT_TAB
FOR EACH ROW
BEGIN
    :new.PRICE := :new.RIPENS_LEVEL * :new.BASE_PRICE * :new.WEIGHT;
END;
/
ALTER TRIGGER "FRUIT"."CALCULATEPRICE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INSERTFRUITSENSOR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "FRUIT"."INSERTFRUITSENSOR" 
BEFORE INSERT OR UPDATE ON FRUIT_SENSOR_TAB
FOR EACH ROW

DECLARE
    sensor_dim varchar2(20);
    fruit_dim varchar2(20);
BEGIN
    SELECT s.scan_dimension INTO sensor_dim FROM SENSOR_TAB s WHERE s.id_sensor = :new.sensor_fk; 
    SELECT f.dimension INTO fruit_dim FROM FRUIT_TAB f WHERE f.name_fruit = :new.name_fruit_fk;

    IF (sensor_dim = 'SMALL' AND fruit_dim != 'SMALL') 
    OR (sensor_dim = 'MEDIUM' AND fruit_dim = 'BIG')
       THEN RAISE_APPLICATION_ERROR(-20001, 'Error');
    END IF;
END;
/
ALTER TRIGGER "FRUIT"."INSERTFRUITSENSOR" ENABLE;
