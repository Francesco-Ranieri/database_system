--------------------------------------------------------
--  File created - Saturday-November-26-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ALLERGY_TAB
--------------------------------------------------------

  CREATE TABLE "FRUIT"."ALLERGY_TAB" OF "FRUIT"."ALLERGY_TYPE" 
 OIDINDEX  ( PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ) 
 SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FRESHNESS_TAB
--------------------------------------------------------

  CREATE TABLE "FRUIT"."FRESHNESS_TAB" 
   (	"ID_FRESHNESS" NUMBER, 
	"DAYS_FRESHNESS" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FRUIT_RECIPE_TAB
--------------------------------------------------------

  CREATE TABLE "FRUIT"."FRUIT_RECIPE_TAB" 
   (	"ID_FRUIT_RECIPE" NUMBER, 
	"NAME_FRUIT_FK" VARCHAR2(20 BYTE), 
	"RECIPE_FK" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FRUIT_SENSOR_TAB
--------------------------------------------------------

  CREATE TABLE "FRUIT"."FRUIT_SENSOR_TAB" 
   (	"ID_FRUIT_SENSOR" NUMBER, 
	"NAME_FRUIT_FK" VARCHAR2(20 BYTE), 
	"SENSOR_FK" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FRUIT_TAB
--------------------------------------------------------

  CREATE TABLE "FRUIT"."FRUIT_TAB" 
   (	"NAME_FRUIT" VARCHAR2(20 BYTE), 
	"IS_PEEL_EDIBLE" VARCHAR2(20 BYTE), 
	"DATE_ARRIVAL" TIMESTAMP (6), 
	"WEIGHT" NUMBER, 
	"VOLUME" NUMBER, 
	"DIMENSION" VARCHAR2(20 BYTE), 
	"RIPENS_LEVEL" NUMBER, 
	"PRICE" NUMBER, 
	"ALLERGY_FK" NUMBER, 
	"FRESHNESS_FK" NUMBER, 
	"IS_FRESH" VARCHAR2(20 BYTE) DEFAULT 'True', 
	"BASE_PRICE" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table OFFER_TAB
--------------------------------------------------------

  CREATE TABLE "FRUIT"."OFFER_TAB" 
   (	"ID_OFFER" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"DISCOUNTED_PRICE" NUMBER, 
	"DISCOUNTED_WEIGHT" NUMBER, 
	"FRUIT_FK" VARCHAR2(20 BYTE), 
	"STATUS" VARCHAR2(20 BYTE) DEFAULT 'ON SALE'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table OFFER_USER_TAB
--------------------------------------------------------

  CREATE TABLE "FRUIT"."OFFER_USER_TAB" 
   (	"ID_OFFER_USER" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"OFFER_FK" NUMBER, 
	"USER_FK" NUMBER, 
	"STATUS" VARCHAR2(20 BYTE) DEFAULT 'SOLD'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RECIPE_TAB
--------------------------------------------------------

  CREATE TABLE "FRUIT"."RECIPE_TAB" 
   (	"ID_RECIPE" NUMBER, 
	"DESCRIPTION" VARCHAR2(200 BYTE), 
	"NAME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SENSOR_TAB
--------------------------------------------------------

  CREATE TABLE "FRUIT"."SENSOR_TAB" 
   (	"ID_SENSOR" NUMBER, 
	"NAME" VARCHAR2(20 BYTE), 
	"MEDIUM_CONSUMPTION" VARCHAR2(20 BYTE), 
	"COST" NUMBER, 
	"BRAND" VARCHAR2(20 BYTE), 
	"SCAN_DIMENSION" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USER_TAB
--------------------------------------------------------

  CREATE TABLE "FRUIT"."USER_TAB" 
   (	"ID_USER" NUMBER, 
	"IS_OPERATOR" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"SURNAME" VARCHAR2(20 BYTE), 
	"FISCAL_CODE" VARCHAR2(16 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007655
--------------------------------------------------------

  CREATE UNIQUE INDEX "FRUIT"."SYS_C007655" ON "FRUIT"."ALLERGY_TAB" ("ID_ALLERGY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007656
--------------------------------------------------------

  CREATE UNIQUE INDEX "FRUIT"."SYS_C007656" ON "FRUIT"."ALLERGY_TAB" ("SYS_NC_OID$") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FRESHNESS_TAB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FRUIT"."FRESHNESS_TAB_PK" ON "FRUIT"."FRESHNESS_TAB" ("ID_FRESHNESS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FRUIT_RECIPE_TAB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FRUIT"."FRUIT_RECIPE_TAB_PK" ON "FRUIT"."FRUIT_RECIPE_TAB" ("ID_FRUIT_RECIPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FRUIT_SENSOR_TAB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FRUIT"."FRUIT_SENSOR_TAB_PK" ON "FRUIT"."FRUIT_SENSOR_TAB" ("ID_FRUIT_SENSOR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FRUIT_TAB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FRUIT"."FRUIT_TAB_PK" ON "FRUIT"."FRUIT_TAB" ("NAME_FRUIT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index OFFER_TAB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FRUIT"."OFFER_TAB_PK" ON "FRUIT"."OFFER_TAB" ("ID_OFFER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index OFFER_TABLE_USER_1_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FRUIT"."OFFER_TABLE_USER_1_PK" ON "FRUIT"."OFFER_USER_TAB" ("ID_OFFER_USER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index RECIPE_TAB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FRUIT"."RECIPE_TAB_PK" ON "FRUIT"."RECIPE_TAB" ("ID_RECIPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SENSOR_TAB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FRUIT"."SENSOR_TAB_PK" ON "FRUIT"."SENSOR_TAB" ("ID_SENSOR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index USER_TAB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FRUIT"."USER_TAB_PK" ON "FRUIT"."USER_TAB" ("ID_USER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
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
--  Constraints for Table ALLERGY_TAB
--------------------------------------------------------

  ALTER TABLE "FRUIT"."ALLERGY_TAB" ADD PRIMARY KEY ("ID_ALLERGY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FRUIT"."ALLERGY_TAB" ADD UNIQUE ("SYS_NC_OID$") RELY
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FRESHNESS_TAB
--------------------------------------------------------

  ALTER TABLE "FRUIT"."FRESHNESS_TAB" MODIFY ("ID_FRESHNESS" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."FRESHNESS_TAB" MODIFY ("DAYS_FRESHNESS" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."FRESHNESS_TAB" ADD CONSTRAINT "FRESHNESS_TAB_PK" PRIMARY KEY ("ID_FRESHNESS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FRUIT_RECIPE_TAB
--------------------------------------------------------

  ALTER TABLE "FRUIT"."FRUIT_RECIPE_TAB" MODIFY ("ID_FRUIT_RECIPE" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."FRUIT_RECIPE_TAB" MODIFY ("NAME_FRUIT_FK" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."FRUIT_RECIPE_TAB" MODIFY ("RECIPE_FK" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."FRUIT_RECIPE_TAB" ADD CONSTRAINT "FRUIT_RECIPE_TAB_PK" PRIMARY KEY ("ID_FRUIT_RECIPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FRUIT_SENSOR_TAB
--------------------------------------------------------

  ALTER TABLE "FRUIT"."FRUIT_SENSOR_TAB" MODIFY ("ID_FRUIT_SENSOR" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."FRUIT_SENSOR_TAB" MODIFY ("NAME_FRUIT_FK" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."FRUIT_SENSOR_TAB" MODIFY ("SENSOR_FK" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."FRUIT_SENSOR_TAB" ADD CONSTRAINT "FRUIT_SENSOR_TAB_PK" PRIMARY KEY ("ID_FRUIT_SENSOR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FRUIT_TAB
--------------------------------------------------------

  ALTER TABLE "FRUIT"."FRUIT_TAB" MODIFY ("NAME_FRUIT" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."FRUIT_TAB" MODIFY ("IS_PEEL_EDIBLE" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."FRUIT_TAB" MODIFY ("DATE_ARRIVAL" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."FRUIT_TAB" MODIFY ("WEIGHT" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."FRUIT_TAB" MODIFY ("VOLUME" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."FRUIT_TAB" MODIFY ("DIMENSION" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."FRUIT_TAB" MODIFY ("RIPENS_LEVEL" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."FRUIT_TAB" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."FRUIT_TAB" MODIFY ("FRESHNESS_FK" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."FRUIT_TAB" ADD CONSTRAINT "FRUIT_TAB_PK" PRIMARY KEY ("NAME_FRUIT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table OFFER_TAB
--------------------------------------------------------

  ALTER TABLE "FRUIT"."OFFER_TAB" MODIFY ("ID_OFFER" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."OFFER_TAB" ADD CONSTRAINT "OFFER_TAB_PK" PRIMARY KEY ("ID_OFFER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FRUIT"."OFFER_TAB" MODIFY ("DISCOUNTED_PRICE" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."OFFER_TAB" MODIFY ("DISCOUNTED_WEIGHT" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."OFFER_TAB" MODIFY ("FRUIT_FK" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table OFFER_USER_TAB
--------------------------------------------------------

  ALTER TABLE "FRUIT"."OFFER_USER_TAB" MODIFY ("ID_OFFER_USER" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."OFFER_USER_TAB" ADD CONSTRAINT "OFFER_TABLE_USER_1_PK" PRIMARY KEY ("ID_OFFER_USER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FRUIT"."OFFER_USER_TAB" MODIFY ("OFFER_FK" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."OFFER_USER_TAB" MODIFY ("USER_FK" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RECIPE_TAB
--------------------------------------------------------

  ALTER TABLE "FRUIT"."RECIPE_TAB" MODIFY ("ID_RECIPE" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."RECIPE_TAB" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."RECIPE_TAB" ADD CONSTRAINT "RECIPE_TAB_PK" PRIMARY KEY ("ID_RECIPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FRUIT"."RECIPE_TAB" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SENSOR_TAB
--------------------------------------------------------

  ALTER TABLE "FRUIT"."SENSOR_TAB" MODIFY ("ID_SENSOR" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."SENSOR_TAB" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."SENSOR_TAB" MODIFY ("MEDIUM_CONSUMPTION" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."SENSOR_TAB" MODIFY ("COST" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."SENSOR_TAB" MODIFY ("BRAND" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."SENSOR_TAB" ADD CONSTRAINT "SENSOR_TAB_PK" PRIMARY KEY ("ID_SENSOR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FRUIT"."SENSOR_TAB" MODIFY ("SCAN_DIMENSION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USER_TAB
--------------------------------------------------------

  ALTER TABLE "FRUIT"."USER_TAB" MODIFY ("ID_USER" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."USER_TAB" MODIFY ("IS_OPERATOR" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."USER_TAB" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."USER_TAB" MODIFY ("SURNAME" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."USER_TAB" MODIFY ("FISCAL_CODE" NOT NULL ENABLE);
  ALTER TABLE "FRUIT"."USER_TAB" ADD CONSTRAINT "USER_TAB_PK" PRIMARY KEY ("ID_USER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FRUIT_RECIPE_TAB
--------------------------------------------------------

  ALTER TABLE "FRUIT"."FRUIT_RECIPE_TAB" ADD CONSTRAINT "FRUIT_RECIPE_TAB_FK1" FOREIGN KEY ("NAME_FRUIT_FK")
	  REFERENCES "FRUIT"."FRUIT_TAB" ("NAME_FRUIT") ENABLE;
  ALTER TABLE "FRUIT"."FRUIT_RECIPE_TAB" ADD CONSTRAINT "FRUIT_RECIPE_TAB_FK2" FOREIGN KEY ("RECIPE_FK")
	  REFERENCES "FRUIT"."RECIPE_TAB" ("ID_RECIPE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FRUIT_SENSOR_TAB
--------------------------------------------------------

  ALTER TABLE "FRUIT"."FRUIT_SENSOR_TAB" ADD CONSTRAINT "SENSOR_TAB_FK2" FOREIGN KEY ("SENSOR_FK")
	  REFERENCES "FRUIT"."SENSOR_TAB" ("ID_SENSOR") ENABLE;
  ALTER TABLE "FRUIT"."FRUIT_SENSOR_TAB" ADD CONSTRAINT "FRUIT_TAB_FK2" FOREIGN KEY ("NAME_FRUIT_FK")
	  REFERENCES "FRUIT"."FRUIT_TAB" ("NAME_FRUIT") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FRUIT_TAB
--------------------------------------------------------

  ALTER TABLE "FRUIT"."FRUIT_TAB" ADD CONSTRAINT "ALLERGY_FK1" FOREIGN KEY ("ALLERGY_FK")
	  REFERENCES "FRUIT"."ALLERGY_TAB" ("ID_ALLERGY") ENABLE;
  ALTER TABLE "FRUIT"."FRUIT_TAB" ADD CONSTRAINT "FRESHNESS_FK1" FOREIGN KEY ("FRESHNESS_FK")
	  REFERENCES "FRUIT"."FRESHNESS_TAB" ("ID_FRESHNESS") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table OFFER_TAB
--------------------------------------------------------

  ALTER TABLE "FRUIT"."OFFER_TAB" ADD CONSTRAINT "FRUIT_TAB_FK1" FOREIGN KEY ("FRUIT_FK")
	  REFERENCES "FRUIT"."FRUIT_TAB" ("NAME_FRUIT") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table OFFER_USER_TAB
--------------------------------------------------------

  ALTER TABLE "FRUIT"."OFFER_USER_TAB" ADD CONSTRAINT "USER_TAB_1_FK1" FOREIGN KEY ("USER_FK")
	  REFERENCES "FRUIT"."USER_TAB" ("ID_USER") ENABLE;
  ALTER TABLE "FRUIT"."OFFER_USER_TAB" ADD CONSTRAINT "OFFER_TAB_1_FK2" FOREIGN KEY ("OFFER_FK")
	  REFERENCES "FRUIT"."OFFER_TAB" ("ID_OFFER") ENABLE;
