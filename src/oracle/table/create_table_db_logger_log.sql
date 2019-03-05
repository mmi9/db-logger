CREATE TABLE DB_LOGGER_LOG(
  ID             NUMBER(19)      NOT NULL,
  "LEVEL"        VARCHAR2(8)     NOT NULL,
  MSG            VARCHAR2(4000)  NOT NULL,
  INCLUSION_DATE DATE            NOT NULL,
  CONSTRAINT     PK_TB_LOG       PRIMARY KEY(ID_LOG)
);
