CREATE OR REPLACE PROCEDURE SP_CONSUMER_STATIC_SAVE
(
P_OSR_CONSUMER_KEY          IN        VARCHAR2,
P_RESULT                    OUT       NUMBER
)
AS
 
-- PROCEDURE TO Fetch the static create key for this provider.
BEGIN
P_RESULT := 0;


 INSERT INTO OAUTH_SERVER_REGISTRY
 (OSR_ID, OSR_ENABLED, OSR_STATUS, OSR_USA_ID_REF, OSR_CONSUMER_KEY, OSR_CONSUMER_SECRET, OSR_REQUESTER_NAME, OSR_REQUESTER_EMAIL, OSR_CALLBACK_URI, 
					OSR_APPLICATION_URI, OSR_APPLICATION_TITLE, OSR_APPLICATION_DESCR, OSR_APPLICATION_NOTES,
					OSR_APPLICATION_TYPE, OSR_APPLICATION_COMMERCIAL, OSR_TIMESTAMP,OSR_ISSUE_DATE)
  VALUES
  (SEQ_OSR_ID.NEXTVAL, 1, 'ACTIVE', NULL, P_OSR_CONSUMER_KEY, '\', '\', '\', '\', '\', 
   'STATIC SHARED CONSUMER KEY', '\', 'STATIC SHARED CONSUMER KEY', '\', 0, SYSDATE, SYSDATE);
              

EXCEPTION
WHEN OTHERS THEN
-- CALL THE FUNCTION TO LOG ERRORS
ROLLBACK;
P_RESULT := 1; -- ERROR
END;
/