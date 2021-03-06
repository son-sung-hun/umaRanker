--------------------------------------------------------
--  파일이 생성됨 - 목요일-9월-30-2021   
--------------------------------------------------------
DROP TABLE "UMA"."PIXIV_DATA" cascade constraints;
DROP TABLE "UMA"."TWITTER_DATA" cascade constraints;
DROP TABLE "UMA"."UMA_DATA" cascade constraints;
--------------------------------------------------------
--  DDL for Table PIXIV_DATA
--------------------------------------------------------

  CREATE TABLE "UMA"."PIXIV_DATA" 
   (	"UMA_CODE" NUMBER, 
	"PIXIV_CODE" NUMBER, 
	"UPLOAD_DATE" DATE, 
	"CONTENT" VARCHAR2(1000 BYTE), 
	"PIC_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "UMA"."PIXIV_DATA"."UMA_CODE" IS '우마무스메코드';
   COMMENT ON COLUMN "UMA"."PIXIV_DATA"."PIXIV_CODE" IS '픽시브 이력코드';
   COMMENT ON COLUMN "UMA"."PIXIV_DATA"."UPLOAD_DATE" IS '작성일자';
   COMMENT ON COLUMN "UMA"."PIXIV_DATA"."CONTENT" IS '내용';
   COMMENT ON COLUMN "UMA"."PIXIV_DATA"."PIC_ID" IS '그림ID';
   COMMENT ON TABLE "UMA"."PIXIV_DATA"  IS '픽시브 크롤링';
--------------------------------------------------------
--  DDL for Table TWITTER_DATA
--------------------------------------------------------

  CREATE TABLE "UMA"."TWITTER_DATA" 
   (	"UMA_CODE" NUMBER, 
	"TWITTER_CODE" NUMBER, 
	"UPLOAD_DATE" DATE, 
	"CONTENT" VARCHAR2(1000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "UMA"."TWITTER_DATA"."UMA_CODE" IS '우마무스메코드';
   COMMENT ON COLUMN "UMA"."TWITTER_DATA"."TWITTER_CODE" IS '트위터 이력코드';
   COMMENT ON COLUMN "UMA"."TWITTER_DATA"."UPLOAD_DATE" IS '작성일자';
   COMMENT ON COLUMN "UMA"."TWITTER_DATA"."CONTENT" IS '내용';
   COMMENT ON TABLE "UMA"."TWITTER_DATA"  IS '트위터 크롤링';
--------------------------------------------------------
--  DDL for Table UMA_DATA
--------------------------------------------------------

  CREATE TABLE "UMA"."UMA_DATA" 
   (	"UMA_CODE" NUMBER, 
	"UMA_NAME" VARCHAR2(1000 BYTE), 
	"UMA_HEIGHT" NUMBER, 
	"UMA_WEIGHT" VARCHAR2(1000 BYTE), 
	"THREE_B" NUMBER, 
	"THREE_W" NUMBER, 
	"THREE_H" NUMBER, 
	"BIRTH_DAY" NUMBER, 
	"UMA_VOICE" VARCHAR2(1000 BYTE), 
	"UMA_CONTENT" VARCHAR2(2000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "UMA"."UMA_DATA"."UMA_CODE" IS '우마무스메코드';
   COMMENT ON COLUMN "UMA"."UMA_DATA"."UMA_NAME" IS '이름';
   COMMENT ON COLUMN "UMA"."UMA_DATA"."UMA_HEIGHT" IS '키';
   COMMENT ON COLUMN "UMA"."UMA_DATA"."UMA_WEIGHT" IS '체중';
   COMMENT ON COLUMN "UMA"."UMA_DATA"."THREE_B" IS '쓰리사이즈 B';
   COMMENT ON COLUMN "UMA"."UMA_DATA"."THREE_W" IS '쓰리사이즈 W';
   COMMENT ON COLUMN "UMA"."UMA_DATA"."THREE_H" IS '쓰리사이즈 H';
   COMMENT ON COLUMN "UMA"."UMA_DATA"."BIRTH_DAY" IS '생일';
   COMMENT ON COLUMN "UMA"."UMA_DATA"."UMA_VOICE" IS '성우';
   COMMENT ON COLUMN "UMA"."UMA_DATA"."UMA_CONTENT" IS '설명';
   COMMENT ON TABLE "UMA"."UMA_DATA"  IS '우마무스메 데이터';
REM INSERTING into UMA.PIXIV_DATA
SET DEFINE OFF;
REM INSERTING into UMA.TWITTER_DATA
SET DEFINE OFF;
REM INSERTING into UMA.UMA_DATA
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index 엔터티3_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "UMA"."엔터티3_PK" ON "UMA"."TWITTER_DATA" ("TWITTER_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index 엔터티1_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "UMA"."엔터티1_PK" ON "UMA"."UMA_DATA" ("UMA_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index 엔터티2_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "UMA"."엔터티2_PK" ON "UMA"."PIXIV_DATA" ("PIXIV_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table TWITTER_DATA
--------------------------------------------------------

  ALTER TABLE "UMA"."TWITTER_DATA" ADD CONSTRAINT "엔터티3_PK" PRIMARY KEY ("TWITTER_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "UMA"."TWITTER_DATA" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "UMA"."TWITTER_DATA" MODIFY ("UPLOAD_DATE" NOT NULL ENABLE);
  ALTER TABLE "UMA"."TWITTER_DATA" MODIFY ("TWITTER_CODE" NOT NULL ENABLE);
  ALTER TABLE "UMA"."TWITTER_DATA" MODIFY ("UMA_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table UMA_DATA
--------------------------------------------------------

  ALTER TABLE "UMA"."UMA_DATA" ADD CONSTRAINT "엔터티1_PK" PRIMARY KEY ("UMA_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "UMA"."UMA_DATA" MODIFY ("UMA_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "UMA"."UMA_DATA" MODIFY ("UMA_VOICE" NOT NULL ENABLE);
  ALTER TABLE "UMA"."UMA_DATA" MODIFY ("BIRTH_DAY" NOT NULL ENABLE);
  ALTER TABLE "UMA"."UMA_DATA" MODIFY ("UMA_WEIGHT" NOT NULL ENABLE);
  ALTER TABLE "UMA"."UMA_DATA" MODIFY ("UMA_HEIGHT" NOT NULL ENABLE);
  ALTER TABLE "UMA"."UMA_DATA" MODIFY ("UMA_NAME" NOT NULL ENABLE);
  ALTER TABLE "UMA"."UMA_DATA" MODIFY ("UMA_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PIXIV_DATA
--------------------------------------------------------

  ALTER TABLE "UMA"."PIXIV_DATA" ADD CONSTRAINT "엔터티2_PK" PRIMARY KEY ("PIXIV_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "UMA"."PIXIV_DATA" MODIFY ("PIC_ID" NOT NULL ENABLE);
  ALTER TABLE "UMA"."PIXIV_DATA" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "UMA"."PIXIV_DATA" MODIFY ("UPLOAD_DATE" NOT NULL ENABLE);
  ALTER TABLE "UMA"."PIXIV_DATA" MODIFY ("PIXIV_CODE" NOT NULL ENABLE);
  ALTER TABLE "UMA"."PIXIV_DATA" MODIFY ("UMA_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table PIXIV_DATA
--------------------------------------------------------

  ALTER TABLE "UMA"."PIXIV_DATA" ADD CONSTRAINT "PIXIV_DATA_FK" FOREIGN KEY ("UMA_CODE")
	  REFERENCES "UMA"."UMA_DATA" ("UMA_CODE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TWITTER_DATA
--------------------------------------------------------

  ALTER TABLE "UMA"."TWITTER_DATA" ADD CONSTRAINT "TWITTER_DATA_FK" FOREIGN KEY ("UMA_CODE")
	  REFERENCES "UMA"."UMA_DATA" ("UMA_CODE") ENABLE;
