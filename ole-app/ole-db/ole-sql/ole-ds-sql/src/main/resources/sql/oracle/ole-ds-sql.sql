
-----------------------------------------------------------------------------
-- OLE_DS_ACCESS_LOCATION_CODE_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_ACCESS_LOCATION_CODE_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_ACCESS_LOCATION_CODE_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_ACCESS_LOCATION_CODE_T
(
      ACCESS_LOCATION_CODE_ID NUMBER(10,0)
        , CODE VARCHAR2(100)
        , NAME VARCHAR2(500)
    

)
/

ALTER TABLE OLE_DS_ACCESS_LOCATION_CODE_T
    ADD CONSTRAINT OLE_DS_ACCESS_LOCATION_CODEP1
PRIMARY KEY (ACCESS_LOCATION_CODE_ID)
/







-----------------------------------------------------------------------------
-- OLE_DS_AUTHENTICATION_TYPE_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_AUTHENTICATION_TYPE_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_AUTHENTICATION_TYPE_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_AUTHENTICATION_TYPE_T
(
      AUTHENTICATION_TYPE_ID NUMBER(10,0)
        , CODE VARCHAR2(100)
        , NAME VARCHAR2(500)
    

)
/

ALTER TABLE OLE_DS_AUTHENTICATION_TYPE_T
    ADD CONSTRAINT OLE_DS_AUTHENTICATION_TYPE_P1
PRIMARY KEY (AUTHENTICATION_TYPE_ID)
/







-----------------------------------------------------------------------------
-- OLE_DS_BIB_HOLDINGS_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_BIB_HOLDINGS_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_BIB_HOLDINGS_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_BIB_HOLDINGS_T
(
      BIB_HOLDINGS_ID NUMBER(10,0)
        , HOLDINGS_ID NUMBER(10,0) NOT NULL
        , BIB_ID NUMBER(10,0) NOT NULL
    

)
/

ALTER TABLE OLE_DS_BIB_HOLDINGS_T
    ADD CONSTRAINT OLE_DS_BIB_HOLDINGS_TP1
PRIMARY KEY (BIB_HOLDINGS_ID)
/


CREATE INDEX OLE_DS_BIB_HOLDINGS_TI1 
  ON OLE_DS_BIB_HOLDINGS_T 
  (BIB_ID)
/
CREATE INDEX OLE_DS_BIB_HOLDINGS_TI2 
  ON OLE_DS_BIB_HOLDINGS_T 
  (HOLDINGS_ID)
/





-----------------------------------------------------------------------------
-- OLE_DS_BIB_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_BIB_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_BIB_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_BIB_T
(
      BIB_ID NUMBER(10,0)
        , FORMER_ID VARCHAR2(45)
        , FAST_ADD CHAR(1)
        , STAFF_ONLY CHAR(1)
        , CREATED_BY VARCHAR2(40)
        , DATE_CREATED TIMESTAMP
        , UPDATED_BY VARCHAR2(40)
        , DATE_UPDATED TIMESTAMP
        , STATUS VARCHAR2(20)
        , STATUS_UPDATED_BY VARCHAR2(40)
        , STATUS_UPDATED_DATE TIMESTAMP
        , UNIQUE_ID_PREFIX VARCHAR2(10)
        , CONTENT CLOB
    

)
/

ALTER TABLE OLE_DS_BIB_T
    ADD CONSTRAINT OLE_DS_BIB_TP1
PRIMARY KEY (BIB_ID)
/







-----------------------------------------------------------------------------
-- OLE_DS_BIB_INFO_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_BIB_INFO_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_BIB_INFO_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_BIB_INFO_T
(
      BIB_ID_STR VARCHAR2(20)
        , BIB_ID NUMBER(20,0)
        , TITLE VARCHAR2(4000)
        , AUTHOR VARCHAR2(4000)
        , PUBLISHER VARCHAR2(4000)
        , ISXN VARCHAR2(100)
    

)
/

ALTER TABLE OLE_DS_BIB_INFO_T
    ADD CONSTRAINT OLE_DS_BIB_INFO_TP1
PRIMARY KEY (BIB_ID_STR)
/


CREATE INDEX OLE_DS_BIB_INFO_TI1 
  ON OLE_DS_BIB_INFO_T 
  (BIB_ID)
/





-----------------------------------------------------------------------------
-- OLE_DS_HOLDINGS_COVERAGE_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_HOLDINGS_COVERAGE_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_HOLDINGS_COVERAGE_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_HOLDINGS_COVERAGE_T
(
      HOLDINGS_COVERAGE_ID NUMBER(10,0)
        , HOLDINGS_ID NUMBER(10,0)
        , COVERAGE_START_DATE VARCHAR2(100)
        , COVERAGE_START_VOLUME VARCHAR2(100)
        , COVERAGE_START_ISSUE VARCHAR2(100)
        , COVERAGE_END_DATE VARCHAR2(100)
        , COVERAGE_END_VOLUME VARCHAR2(100)
        , COVERAGE_END_ISSUE VARCHAR2(100)
    

)
/

ALTER TABLE OLE_DS_HOLDINGS_COVERAGE_T
    ADD CONSTRAINT OLE_DS_HOLDINGS_COVERAGE_TP1
PRIMARY KEY (HOLDINGS_COVERAGE_ID)
/







-----------------------------------------------------------------------------
-- OLE_DS_EXT_OWNERSHIP_NOTE_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_EXT_OWNERSHIP_NOTE_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_EXT_OWNERSHIP_NOTE_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_EXT_OWNERSHIP_NOTE_T
(
      EXT_OWNERSHIP_NOTE_ID NUMBER(10,0)
        , TYPE VARCHAR2(20)
        , NOTE VARCHAR2(4000)
        , EXT_OWNERSHIP_ID NUMBER(10,0) NOT NULL
    

)
/

ALTER TABLE OLE_DS_EXT_OWNERSHIP_NOTE_T
    ADD CONSTRAINT OLE_DS_EXT_OWNERSHIP_NOTE_TP1
PRIMARY KEY (EXT_OWNERSHIP_NOTE_ID)
/







-----------------------------------------------------------------------------
-- OLE_DS_EXT_OWNERSHIP_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_EXT_OWNERSHIP_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_EXT_OWNERSHIP_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_EXT_OWNERSHIP_T
(
      EXT_OWNERSHIP_ID NUMBER(10,0)
        , HOLDINGS_ID NUMBER(10,0)
        , EXT_OWNERSHIP_TYPE_ID NUMBER(10,0)
        , ORD NUMBER(10,0)
        , TEXT VARCHAR2(4000)
    

)
/

ALTER TABLE OLE_DS_EXT_OWNERSHIP_T
    ADD CONSTRAINT OLE_DS_EXT_OWNERSHIP_TP1
PRIMARY KEY (EXT_OWNERSHIP_ID)
/


CREATE INDEX OLE_DS_EXT_OWNERSHIP_TI1 
  ON OLE_DS_EXT_OWNERSHIP_T 
  (HOLDINGS_ID)
/





-----------------------------------------------------------------------------
-- OLE_DS_ITM_FORMER_IDENTIFIER_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_ITM_FORMER_IDENTIFIER_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_ITM_FORMER_IDENTIFIER_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_ITM_FORMER_IDENTIFIER_T
(
      ITEM_FORMER_IDENTIFIER_ID NUMBER(10,0)
        , ITEM_ID NUMBER(10,0)
        , TYPE VARCHAR2(100)
        , VALUE VARCHAR2(500)
    

)
/

ALTER TABLE OLE_DS_ITM_FORMER_IDENTIFIER_T
    ADD CONSTRAINT OLE_DS_ITM_FORMER_IDENTIFIEP1
PRIMARY KEY (ITEM_FORMER_IDENTIFIER_ID)
/







-----------------------------------------------------------------------------
-- OLE_DS_HIGH_DENSITY_STORAGE_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_HIGH_DENSITY_STORAGE_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_HIGH_DENSITY_STORAGE_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_HIGH_DENSITY_STORAGE_T
(
      HIGH_DENSITY_STORAGE_ID NUMBER(10,0)
        , HIGH_DENSITY_ROW VARCHAR2(30)
        , HIGH_DENSITY_MODULE VARCHAR2(30)
        , HIGH_DENSITY_SHELF VARCHAR2(30)
        , HIGH_DENSITY_TRAY VARCHAR2(30)
    

)
/

ALTER TABLE OLE_DS_HIGH_DENSITY_STORAGE_T
    ADD CONSTRAINT OLE_DS_HIGH_DENSITY_STORAGEP1
PRIMARY KEY (HIGH_DENSITY_STORAGE_ID)
/







-----------------------------------------------------------------------------
-- OLE_DS_ACCESS_LOCATION_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_ACCESS_LOCATION_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_ACCESS_LOCATION_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_ACCESS_LOCATION_T
(
      ACCESS_LOCATION_ID NUMBER(10,0)
        , HOLDINGS_ID NUMBER(10,0)
        , ACCESS_LOCATION_CODE_ID NUMBER(10,0)
    

)
/

ALTER TABLE OLE_DS_ACCESS_LOCATION_T
    ADD CONSTRAINT OLE_DS_ACCESS_LOCATION_TP1
PRIMARY KEY (ACCESS_LOCATION_ID)
/







-----------------------------------------------------------------------------
-- OLE_DS_HOLDINGS_URI_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_HOLDINGS_URI_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_HOLDINGS_URI_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_HOLDINGS_URI_T
(
      HOLDINGS_URI_ID NUMBER(10,0)
        , HOLDINGS_ID NUMBER(10,0) NOT NULL
        , URI VARCHAR2(400)
        , TEXT VARCHAR2(400)
    

)
/

ALTER TABLE OLE_DS_HOLDINGS_URI_T
    ADD CONSTRAINT OLE_DS_HOLDINGS_URI_TP1
PRIMARY KEY (HOLDINGS_URI_ID)
/







-----------------------------------------------------------------------------
-- OLE_DS_HOLDINGS_DONOR_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_HOLDINGS_DONOR_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_HOLDINGS_DONOR_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_HOLDINGS_DONOR_T
(
      HOLDINGS_DONOR_ID NUMBER(10,0)
        , HOLDINGS_ID NUMBER(10,0)
        , DONOR_CODE VARCHAR2(40)
        , DONOR_DISPLAY_NOTE VARCHAR2(4000)
        , DONOR_NOTE VARCHAR2(4000)
    

)
/

ALTER TABLE OLE_DS_HOLDINGS_DONOR_T
    ADD CONSTRAINT OLE_DS_HOLDINGS_DONOR_TP1
PRIMARY KEY (HOLDINGS_DONOR_ID)
/







-----------------------------------------------------------------------------
-- OLE_DS_HOLDINGS_NOTE_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_HOLDINGS_NOTE_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_HOLDINGS_NOTE_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_HOLDINGS_NOTE_T
(
      HOLDINGS_NOTE_ID NUMBER(10,0)
        , HOLDINGS_ID NUMBER(10,0) NOT NULL
        , TYPE VARCHAR2(100)
        , NOTE VARCHAR2(4000)
    

)
/

ALTER TABLE OLE_DS_HOLDINGS_NOTE_T
    ADD CONSTRAINT OLE_DS_HOLDINGS_NOTE_TP1
PRIMARY KEY (HOLDINGS_NOTE_ID)
/







-----------------------------------------------------------------------------
-- OLE_DS_HOLDINGS_STAT_SEARCH_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_HOLDINGS_STAT_SEARCH_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_HOLDINGS_STAT_SEARCH_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_HOLDINGS_STAT_SEARCH_T
(
      HOLDINGS_STAT_SEARCH_ID NUMBER(10,0)
        , HOLDINGS_ID NUMBER(10,0)
        , STAT_SEARCH_CODE_ID NUMBER(10,0)
    

)
/

ALTER TABLE OLE_DS_HOLDINGS_STAT_SEARCH_T
    ADD CONSTRAINT OLE_DS_HOLDINGS_STAT_SEARCHP1
PRIMARY KEY (HOLDINGS_STAT_SEARCH_ID)
/







-----------------------------------------------------------------------------
-- OLE_DS_ITEM_HOLDINGS_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_ITEM_HOLDINGS_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_ITEM_HOLDINGS_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_ITEM_HOLDINGS_T
(
      ITEM_HOLDINGS_ID NUMBER(10,0)
        , HOLDINGS_ID NUMBER(10,0) NOT NULL
        , ITEM_ID NUMBER(10,0) NOT NULL
    
    , CONSTRAINT OLE_DS_ITEM_HOLDINGS_TC1 UNIQUE (HOLDINGS_ID, ITEM_ID)

)
/

ALTER TABLE OLE_DS_ITEM_HOLDINGS_T
    ADD CONSTRAINT OLE_DS_ITEM_HOLDINGS_TP1
PRIMARY KEY (ITEM_HOLDINGS_ID)
/


CREATE INDEX OLE_DS_ITEM_HOLDINGS_TI1 
  ON OLE_DS_ITEM_HOLDINGS_T 
  (HOLDINGS_ID)
/
CREATE INDEX OLE_DS_ITEM_HOLDINGS_TI2 
  ON OLE_DS_ITEM_HOLDINGS_T 
  (ITEM_ID)
/





-----------------------------------------------------------------------------
-- OLE_DS_HOLDINGS_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_HOLDINGS_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_HOLDINGS_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_HOLDINGS_T
(
      HOLDINGS_ID NUMBER(10,0)
        , BIB_ID NUMBER(10,0) NOT NULL
        , HOLDINGS_TYPE VARCHAR2(10)
        , FORMER_HOLDINGS_ID VARCHAR2(45)
        , STAFF_ONLY CHAR(1)
        , LOCATION_ID NUMBER(10,0)
        , LOCATION VARCHAR2(300)
        , LOCATION_LEVEL VARCHAR2(300)
        , CALL_NUMBER_TYPE_ID NUMBER(10,0)
        , CALL_NUMBER_PREFIX VARCHAR2(100)
        , CALL_NUMBER VARCHAR2(300)
        , SHELVING_ORDER VARCHAR2(300)
        , RECEIPT_STATUS_ID NUMBER(10,0)
        , COPY_NUMBER VARCHAR2(20)
        , PUBLISHER VARCHAR2(200)
        , ACCESS_STATUS VARCHAR2(40)
        , ACCESS_STATUS_DATE_UPDATED TIMESTAMP
        , SUBSCRIPTION_STATUS VARCHAR2(40)
        , INITIAL_SBRCPTN_START_DT TIMESTAMP
        , CURRENT_SBRCPTN_START_DT TIMESTAMP
        , CURRENT_SBRCPTN_END_DT TIMESTAMP
        , CANCELLATION_CANDIDATE CHAR(1)
        , CANCELLATION_DECISION_DT TIMESTAMP
        , CANCELLATION_EFFECTIVE_DT TIMESTAMP
        , CANCELLATION_REASON VARCHAR2(40)
        , PLATFORM VARCHAR2(200)
        , IMPRINT VARCHAR2(200)
        , LOCAL_PERSISTENT_URI VARCHAR2(400)
        , ALLOW_ILL CHAR(1)
        , AUTHENTICATION_TYPE_ID NUMBER(10,0)
        , PROXIED_RESOURCE VARCHAR2(10)
        , NUMBER_SIMULT_USERS NUMBER(11,0)
        , E_RESOURCE_ID VARCHAR2(40)
        , ADMIN_URL VARCHAR2(400)
        , ADMIN_USERNAME VARCHAR2(100)
        , ADMIN_PASSWORD VARCHAR2(100)
        , ACCESS_USERNAME VARCHAR2(100)
        , ACCESS_PASSWORD VARCHAR2(100)
        , MATERIALS_SPECIFIED VARCHAR2(100)
        , FIRST_INDICATOR VARCHAR2(20)
        , SECOND_INDICATOR VARCHAR2(20)
        , CREATED_BY VARCHAR2(40)
        , DATE_CREATED TIMESTAMP
        , UPDATED_BY VARCHAR2(40)
        , DATE_UPDATED TIMESTAMP
        , UNIQUE_ID_PREFIX VARCHAR2(10)
        , GOKB_IDENTIFIER NUMBER(10,0)
        , SOURCE_HOLDINGS_CONTENT CLOB
    

)
/

ALTER TABLE OLE_DS_HOLDINGS_T
    ADD CONSTRAINT OLE_DS_HOLDINGS_TP1
PRIMARY KEY (HOLDINGS_ID)
/







-----------------------------------------------------------------------------
-- OLE_DS_ITEM_DONOR_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_ITEM_DONOR_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_ITEM_DONOR_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_ITEM_DONOR_T
(
      ITEM_DONOR_ID NUMBER(10,0)
        , ITEM_ID NUMBER(10,0)
        , DONOR_CODE VARCHAR2(10)
        , DONOR_DISPLAY_NOTE VARCHAR2(4000)
        , DONOR_NOTE VARCHAR2(4000)
    

)
/

ALTER TABLE OLE_DS_ITEM_DONOR_T
    ADD CONSTRAINT OLE_DS_ITEM_DONOR_TP1
PRIMARY KEY (ITEM_DONOR_ID)
/







-----------------------------------------------------------------------------
-- OLE_DS_ITEM_NOTE_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_ITEM_NOTE_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_ITEM_NOTE_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_ITEM_NOTE_T
(
      ITEM_NOTE_ID NUMBER(10,0)
        , ITEM_ID NUMBER(10,0)
        , TYPE VARCHAR2(50)
        , NOTE VARCHAR2(4000)
    

)
/

ALTER TABLE OLE_DS_ITEM_NOTE_T
    ADD CONSTRAINT OLE_DS_ITEM_NOTE_TP1
PRIMARY KEY (ITEM_NOTE_ID)
/







-----------------------------------------------------------------------------
-- OLE_DS_ITEM_STAT_SEARCH_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_ITEM_STAT_SEARCH_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_ITEM_STAT_SEARCH_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_ITEM_STAT_SEARCH_T
(
      ITEM_STAT_SEARCH_ID NUMBER(10,0)
        , ITEM_ID NUMBER(10,0)
        , STAT_SEARCH_CODE_ID NUMBER(10,0)
    

)
/

ALTER TABLE OLE_DS_ITEM_STAT_SEARCH_T
    ADD CONSTRAINT OLE_DS_ITEM_STAT_SEARCH_TP1
PRIMARY KEY (ITEM_STAT_SEARCH_ID)
/







-----------------------------------------------------------------------------
-- OLE_DS_ITEM_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_ITEM_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_ITEM_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_ITEM_T
(
      ITEM_ID NUMBER(10,0)
        , HOLDINGS_ID NUMBER(10,0) NOT NULL
        , FAST_ADD CHAR(1)
        , STAFF_ONLY CHAR(1)
        , BARCODE VARCHAR2(30)
        , URI VARCHAR2(400)
        , ITEM_TYPE_ID NUMBER(10,0)
        , TEMP_ITEM_TYPE_ID NUMBER(10,0)
        , ITEM_STATUS_ID NUMBER(10,0)
        , ITEM_STATUS_DATE_UPDATED TIMESTAMP
        , LOCATION_ID NUMBER(10,0)
        , LOCATION VARCHAR2(600)
        , LOCATION_LEVEL VARCHAR2(600)
        , CALL_NUMBER_TYPE_ID NUMBER(10,0)
        , CALL_NUMBER_PREFIX VARCHAR2(40)
        , CALL_NUMBER VARCHAR2(100)
        , SHELVING_ORDER VARCHAR2(300)
        , ENUMERATION VARCHAR2(100)
        , VOLUME_NUMBER VARCHAR2(100)
        , CHRONOLOGY VARCHAR2(100)
        , COPY_NUMBER VARCHAR2(20)
        , NUM_PIECES VARCHAR2(10)
        , PURCHASE_ORDER_LINE_ITEM_ID VARCHAR2(45)
        , VENDOR_LINE_ITEM_ID VARCHAR2(45)
        , FUND VARCHAR2(100)
        , PRICE NUMBER
        , CLAIMS_RETURNED CHAR(1)
        , CLAIMS_RETURNED_DATE_CREATED TIMESTAMP
        , CLAIMS_RETURNED_NOTE VARCHAR2(400)
        , CURRENT_BORROWER VARCHAR2(30)
        , PROXY_BORROWER VARCHAR2(30)
        , DUE_DATE_TIME TIMESTAMP
        , CHECK_OUT_DATE_TIME TIMESTAMP
        , CHECK_IN_NOTE VARCHAR2(400)
        , ITEM_DAMAGED_STATUS CHAR(1)
        , ITEM_DAMAGED_NOTE VARCHAR2(400)
        , MISSING_PIECES CHAR(1)
        , MISSING_PIECES_EFFECTIVE_DATE TIMESTAMP
        , MISSING_PIECES_COUNT NUMBER(10,0)
        , MISSING_PIECES_NOTE VARCHAR2(400)
        , BARCODE_ARSL VARCHAR2(200)
        , HIGH_DENSITY_STORAGE_ID NUMBER(10,0)
        , NUM_OF_RENEW NUMBER(10,0)
        , CREATED_BY VARCHAR2(40)
        , DATE_CREATED TIMESTAMP
        , UPDATED_BY VARCHAR2(40)
        , DATE_UPDATED TIMESTAMP
        , UNIQUE_ID_PREFIX VARCHAR2(10)
        , ORG_DUE_DATE_TIME TIMESTAMP
        , DESC_OF_PIECES VARCHAR2(400)
    

)
/

ALTER TABLE OLE_DS_ITEM_T
    ADD CONSTRAINT OLE_DS_ITEM_TP1
PRIMARY KEY (ITEM_ID)
/


CREATE INDEX OLE_DS_ITEM_TI1 
  ON OLE_DS_ITEM_T 
  (BARCODE)
/
CREATE INDEX OLE_DS_ITEM_TI2 
  ON OLE_DS_ITEM_T 
  (HOLDINGS_ID)
/





-----------------------------------------------------------------------------
-- OLE_DS_LOC_CHECKIN_COUNT_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_LOC_CHECKIN_COUNT_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_LOC_CHECKIN_COUNT_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_LOC_CHECKIN_COUNT_T
(
      CHECK_IN_LOCATION_ID NUMBER(10,0)
        , ITEM_ID NUMBER(10,0)
        , LOCATION_NAME VARCHAR2(200)
        , LOCATION_COUNT NUMBER(20,0)
        , LOCATION_IN_HOUSE_COUNT NUMBER(20,0)
    

)
/

ALTER TABLE OLE_DS_LOC_CHECKIN_COUNT_T
    ADD CONSTRAINT OLE_DS_LOC_CHECKIN_COUNT_TP1
PRIMARY KEY (CHECK_IN_LOCATION_ID)
/







-----------------------------------------------------------------------------
-- OLE_DS_PERPETUAL_ACCESS_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_PERPETUAL_ACCESS_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_PERPETUAL_ACCESS_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_PERPETUAL_ACCESS_T
(
      HOLDINGS_PERPETUAL_ACCESS_ID NUMBER(10,0)
        , HOLDINGS_ID NUMBER(10,0)
        , PERPETUAL_ACCESS_START_DATE VARCHAR2(100)
        , PERPETUAL_ACCESS_START_VOLUME VARCHAR2(100)
        , PERPETUAL_ACCESS_START_ISSUE VARCHAR2(100)
        , PERPETUAL_ACCESS_END_DATE VARCHAR2(100)
        , PERPETUAL_ACCESS_END_VOLUME VARCHAR2(100)
        , PERPETUAL_ACCESS_END_ISSUE VARCHAR2(100)
    

)
/

ALTER TABLE OLE_DS_PERPETUAL_ACCESS_T
    ADD CONSTRAINT OLE_DS_PERPETUAL_ACCESS_TP1
PRIMARY KEY (HOLDINGS_PERPETUAL_ACCESS_ID)
/







-----------------------------------------------------------------------------
-- OLE_DS_LICENSE_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_LICENSE_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_LICENSE_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_LICENSE_T
(
      LICENSE_ID NUMBER(10,0)
        , CREATED_BY VARCHAR2(40)
        , DATE_CREATED TIMESTAMP
        , UPDATED_BY VARCHAR2(40)
        , DATE_UPDATED TIMESTAMP
        , FILE_NAME VARCHAR2(400)
        , DOCUMENT_TITLE VARCHAR2(40)
        , DOCUMENT_MIME_TYPE VARCHAR2(100)
        , DOCUMENT_NOTE VARCHAR2(400)
        , AGREEMENT_TYPE VARCHAR2(40)
        , AGREEMENT_NOTE VARCHAR2(400)
        , UNIQUE_ID_PREFIX VARCHAR2(10)
        , CONTENT BLOB
    

)
/

ALTER TABLE OLE_DS_LICENSE_T
    ADD CONSTRAINT OLE_DS_LICENSE_TP1
PRIMARY KEY (LICENSE_ID)
/







-----------------------------------------------------------------------------
-- OLE_ITM_CLM_RTND_HSTRY_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_ITM_CLM_RTND_HSTRY_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_ITM_CLM_RTND_HSTRY_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_ITM_CLM_RTND_HSTRY_T
(
      CLAIMS_RETURNED_ID NUMBER(10,0)
        , CLAIMS_RETURNED_DATE_CREATED TIMESTAMP
        , CLAIMS_RETURNED_NOTE VARCHAR2(400)
        , CLAIMS_RETURNED_PATRON_BARCODE VARCHAR2(100)
        , CLAIMS_RETURNED_PATRON_ID VARCHAR2(40)
        , CLAIMS_RETURNED_OPERATOR_ID VARCHAR2(40)
        , ITEM_ID NUMBER(10,0)
    

)
/

ALTER TABLE OLE_ITM_CLM_RTND_HSTRY_T
    ADD CONSTRAINT OLE_ITM_CLM_RTND_HSTRY_TP1
PRIMARY KEY (CLAIMS_RETURNED_ID)
/


CREATE INDEX OLE_ITM_CLM_RTND_HSTRY_T_I 
  ON OLE_ITM_CLM_RTND_HSTRY_T 
  (CLAIMS_RETURNED_PATRON_BARCODE, CLAIMS_RETURNED_PATRON_ID, CLAIMS_RETURNED_OPERATOR_ID)
/





-----------------------------------------------------------------------------
-- OLE_DS_DMGD_ITM_HSTRY_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_DS_DMGD_ITM_HSTRY_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_DS_DMGD_ITM_HSTRY_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_DS_DMGD_ITM_HSTRY_T
(
      ITM_DMGD_ID NUMBER(10,0)
        , DMGD_ITM_DATE TIMESTAMP
        , DMGD_ITM_NOTE VARCHAR2(400)
        , PATRON_BARCODE VARCHAR2(100)
        , DMGD_PATRON_ID VARCHAR2(40)
        , OPERATOR_ID VARCHAR2(40)
        , ITEM_ID NUMBER(10,0)
    

)
/

ALTER TABLE OLE_DS_DMGD_ITM_HSTRY_T
    ADD CONSTRAINT OLE_DS_DMGD_ITM_HSTRY_TP1
PRIMARY KEY (ITM_DMGD_ID)
/


CREATE INDEX OLE_DS_DMGD_ITM_HSTRY_T_I 
  ON OLE_DS_DMGD_ITM_HSTRY_T 
  (OPERATOR_ID, PATRON_BARCODE, DMGD_PATRON_ID)
/





-----------------------------------------------------------------------------
-- OLE_MISS_PCE_ITM_HSTRY_T
-----------------------------------------------------------------------------
DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'OLE_MISS_PCE_ITM_HSTRY_T';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE OLE_MISS_PCE_ITM_HSTRY_T CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE OLE_MISS_PCE_ITM_HSTRY_T
(
      MISSING_PIECE_ID NUMBER(10,0)
        , ITEM_ID NUMBER(10,0)
        , OPERATOR_ID VARCHAR2(40)
        , PATRON_BARCODE VARCHAR2(100)
        , PATRON_ID VARCHAR2(40)
        , MISSING_PIECE_NOTE VARCHAR2(400)
        , MISSING_PIECE_COUNT NUMBER(10,0)
        , MISSING_PIECE_DATE TIMESTAMP
    

)
/

ALTER TABLE OLE_MISS_PCE_ITM_HSTRY_T
    ADD CONSTRAINT OLE_MISS_PCE_ITM_HSTRY_TP1
PRIMARY KEY (MISSING_PIECE_ID)
/


CREATE INDEX OLE_MISS_PCE_ITM_HSTRY_I 
  ON OLE_MISS_PCE_ITM_HSTRY_T 
  (OPERATOR_ID, PATRON_BARCODE, PATRON_ID)
/




DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_MISS_PCE_ITM_HSTRY_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_MISS_PCE_ITM_HSTRY_S'; END IF;
END;
/

CREATE SEQUENCE OLE_MISS_PCE_ITM_HSTRY_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_ACCESS_LOCATION_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_ACCESS_LOCATION_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_ACCESS_LOCATION_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_AUTHENTICATION_TYPE_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_AUTHENTICATION_TYPE_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_AUTHENTICATION_TYPE_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_BIB_HOLDINGS_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_BIB_HOLDINGS_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_BIB_HOLDINGS_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_BIB_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_BIB_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_BIB_S INCREMENT BY 1 START WITH 10000001 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_EXT_OWNERSHIP_NOTE_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_EXT_OWNERSHIP_NOTE_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_EXT_OWNERSHIP_NOTE_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_EXT_OWNERSHIP_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_EXT_OWNERSHIP_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_EXT_OWNERSHIP_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_ITM_FORMER_IDENTIFIER_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_ITM_FORMER_IDENTIFIER_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_ITM_FORMER_IDENTIFIER_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_HIGH_DENSITY_STORAGE_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_HIGH_DENSITY_STORAGE_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_HIGH_DENSITY_STORAGE_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_HOLDINGS_ACCESS_LOC_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_HOLDINGS_ACCESS_LOC_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_HOLDINGS_ACCESS_LOC_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_HOLDINGS_COVERAGE_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_HOLDINGS_COVERAGE_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_HOLDINGS_COVERAGE_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_HOLDINGS_DONOR_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_HOLDINGS_DONOR_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_HOLDINGS_DONOR_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_HOLDINGS_NOTE_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_HOLDINGS_NOTE_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_HOLDINGS_NOTE_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_ITEM_HOLDINGS_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_ITEM_HOLDINGS_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_ITEM_HOLDINGS_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_HOLDINGS_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_HOLDINGS_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_HOLDINGS_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_HOLDINGS_STAT_SEARCH_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_HOLDINGS_STAT_SEARCH_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_HOLDINGS_STAT_SEARCH_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_HOLDINGS_URI_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_HOLDINGS_URI_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_HOLDINGS_URI_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_ITEM_DONOR_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_ITEM_DONOR_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_ITEM_DONOR_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_ITEM_NOTE_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_ITEM_NOTE_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_ITEM_NOTE_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_ITEM_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_ITEM_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_ITEM_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_ITEM_STAT_SEARCH_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_ITEM_STAT_SEARCH_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_ITEM_STAT_SEARCH_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_ITEM_TYPE_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_ITEM_TYPE_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_ITEM_TYPE_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_LOC_CHECKIN_COUNT_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_LOC_CHECKIN_COUNT_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_LOC_CHECKIN_COUNT_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_PERPETUAL_ACCESS_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_PERPETUAL_ACCESS_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_PERPETUAL_ACCESS_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_LICENSE_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_LICENSE_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_LICENSE_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_ITM_CLM_RTND_HSTRY_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_ITM_CLM_RTND_HSTRY_S'; END IF;
END;
/

CREATE SEQUENCE OLE_ITM_CLM_RTND_HSTRY_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'OLE_DS_DMGD_ITM_HSTRY_S';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE OLE_DS_DMGD_ITM_HSTRY_S'; END IF;
END;
/

CREATE SEQUENCE OLE_DS_DMGD_ITM_HSTRY_S INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER
/

