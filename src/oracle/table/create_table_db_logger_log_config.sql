CREATE TABLE DB_LOGGER_LOG_CONFIG (
  ID         NUMBER            NOT NULL,
  SCOPE      VARCHAR2(64)      NOT NULL,
  KEY        VARCHAR2(64)      NOT NULL,
  VALUE      VARCHAR2(128)     NOT NULL,
  CONSTRAINT PK_DB_LOGGER_LOG_CONFIG  PRIMARY KEY(ID)
);