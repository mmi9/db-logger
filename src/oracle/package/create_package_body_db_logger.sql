CREATE OR REPLACE 
PACKAGE BODY DB_LOGGER AS

	FUNCTION IS_DEBUG_ENABLED
	RETURN NUMBER IS
	  V_VALUE VARCHAR(64);
	  V_RETURN NUMBER := 0;
	BEGIN
	  SELECT VALUE INTO V_VALUE FROM DB_LOGGER_LOG_CONFIG WHERE KEY = 'LEVEL_DEBUG';
	  IF (LENGTH(V_VALUE) = 0 OR V_VALUE IS NULL) THEN V_RETURN := 0;
	  ELSE V_RETURN := 1;
	  END IF;
	  RETURN V_RETURN;
	EXCEPTION
	  WHEN NO_DATA_FOUND THEN
	  RETURN V_RETURN;
	END;

	PROCEDURE CREATE_CONFIG ( 
	  V_SCOPE VARCHAR2,
		V_KEY   VARCHAR2, 
	  V_VALUE VARCHAR2
	) IS
	  vEXCEPTION EXCEPTION;
    vExists NUMBER := 0;
	BEGIN
    SELECT COUNT(1) INTO vExists FROM DB_LOGGER_LOG_CONFIG WHERE SCOPE = V_SCOPE AND KEY = V_KEY AND VALUE = V_VALUE;
    IF(vExists > 0) THEN
      RAISE_APPLICATION_ERROR(-1,'CONFIGURAÇÃO JÁ EXISTE!', FALSE);
    ELSIF (V_SCOPE IS NULL OR LENGTH(V_SCOPE) = 0 OR V_KEY IS NULL OR LENGTH(V_KEY) = 0 OR V_VALUE IS NULL OR LENGTH(V_VALUE) = 0) THEN
      RAISE_APPLICATION_ERROR(-1,'PARÂMETROS INVÁLIDOS!', FALSE);
	  ELSE
      INSERT INTO DB_LOGGER_LOG_CONFIG (ID, SCOPE, KEY, VALUE) 
      VALUES ( SEQ_ID_DB_LOGGER_LOG_CONFIG.NEXTVAL, V_SCOPE, V_KEY, V_VALUE );
	  END IF;
	END CREATE_CONFIG;
END DB_LOGGER;
/