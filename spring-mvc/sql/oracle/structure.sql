DROP TABLE T_USER PURGE;

CREATE TABLE T_USER
( 
    ID       NUMBER (10)    NOT NULL, 
    NAME     VARCHAR2 (150)  NOT NULL, 
    E_MAIL    VARCHAR2 (150)  NOT NULL
);

ALTER TABLE T_USER ADD
(
    CONSTRAINT PK_USER_ID PRIMARY KEY (ID)
);

--DROP TRIGGER T_USER_TRG;
DROP SEQUENCE T_USER_SEQ;

CREATE SEQUENCE T_USER_SEQ
    START WITH 1
    INCREMENT BY 1;

CREATE OR REPLACE TRIGGER T_USER_TRG
    BEFORE INSERT ON T_USER
    FOR EACH ROW
    BEGIN
      SELECT T_USER_SEQ.NEXTVAL
      INTO   :new.ID
      FROM   dual;
    END;
   /

--ALTER TABLE T_USER OWNER TO insurance;
INSERT INTO T_USER (NAME, E_MAIL) VALUES ('Carlos', 'email@email.com');
