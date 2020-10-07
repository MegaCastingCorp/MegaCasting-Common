
/*------------------------------------------------------------
-- Table: USER
------------------------------------------------------------*/
CREATE TABLE USERS(
	ID_USER          INT  NOT NULL ,
	USERNAME         VARCHAR (50)  ,
	USER_PASSWORD    VARCHAR (100)  ,
	USER_MAIL        VARCHAR (1000) NOT NULL ,
	USER_NAISSANCE   DATETIME NOT NULL  ,
	CONSTRAINT USER_PK PRIMARY KEY (ID_USER)
);


/*------------------------------------------------------------
-- Table: ORGANISATION
------------------------------------------------------------*/
CREATE TABLE ORGANISATION(
	ID_ORG       INT  NOT NULL ,
	URL_ORG      VARCHAR (1000) NOT NULL ,
	EMAIL_ORG    VARCHAR (100)  ,
	TEL_ORG      VARCHAR (50) NOT NULL ,
	ADRESS_ORG   VARCHAR (100)   ,
	CONSTRAINT ORGANISATION_PK PRIMARY KEY (ID_ORG)
);


/*------------------------------------------------------------
-- Table: CASTINGS
------------------------------------------------------------*/
CREATE TABLE CASTINGS(
	ID_CASTING          INT  NOT NULL ,
	LABEL               VARCHAR (50)  ,
	DOM_METIERS         VARCHAR (50)  ,
	METIERS             VARCHAR (50) NOT NULL ,
	TYPE_CONTRACT       VARCHAR (50) NOT NULL ,
	DUREE_DIFFUSION     INT   ,
	DATE_DEB_CONTRACT   DATETIME NOT NULL ,
	NB_POSTES           INT  NOT NULL ,
	LOCALISATION        VARCHAR (50) NOT NULL ,
	DESC_POSTE          TEXT   ,
	DESC_PROFIL         TEXT   ,
	COORDONNEES         VARCHAR (50)   ,
	CONSTRAINT CASTINGS_PK PRIMARY KEY (ID_CASTING)
);


/*------------------------------------------------------------
-- Table: PACK
------------------------------------------------------------*/
CREATE TABLE PACK(
	ID_PACK           INT  NOT NULL ,
	PRICE             INT   ,
	AVAILBLE_OFFERS   VARCHAR (50) NOT NULL  ,
	CONSTRAINT PACK_PK PRIMARY KEY (ID_PACK)
);


/*------------------------------------------------------------
-- Table: CIVILITE
------------------------------------------------------------*/
CREATE TABLE CIVILITE(
	ID_CIVILITE   INT  NOT NULL ,
	MALE          VARCHAR (50) NOT NULL ,
	FEMALE        VARCHAR (50) NOT NULL  ,
	CONSTRAINT CIVILITE_PK PRIMARY KEY (ID_CIVILITE)
);


/*------------------------------------------------------------
-- Table: CATEGORIES
------------------------------------------------------------*/
CREATE TABLE CATEGORIES(
	ID_CAT      INT IDENTITY (1,1) NOT NULL ,
	CAT_LABEL   VARCHAR (50)   ,
	CONSTRAINT CATEGORIES_PK PRIMARY KEY (ID_CAT)
);


/*------------------------------------------------------------
-- Table: FILTRES
------------------------------------------------------------*/
CREATE TABLE FILTRES(
	ID_FILTRE      INT IDENTITY (1,1) NOT NULL ,
	CAT_LABEL      VARCHAR (50)  ,
	LABEL_FILTRE   VARCHAR (75) NOT NULL  ,
	CONSTRAINT FILTRES_PK PRIMARY KEY (ID_FILTRE)
);


/*------------------------------------------------------------
-- Table: Postuler
------------------------------------------------------------*/
CREATE TABLE Postuler(
	ID_CASTING   INT  NOT NULL ,
	ID_USER      INT  NOT NULL  ,
	CONSTRAINT Postuler_PK PRIMARY KEY (ID_CASTING,ID_USER)

	,CONSTRAINT Postuler_CASTINGS_FK FOREIGN KEY (ID_CASTING) REFERENCES CASTINGS(ID_CASTING)
	,CONSTRAINT Postuler_USER0_FK FOREIGN KEY (ID_USER) REFERENCES USERS(ID_USER)
);


/*------------------------------------------------------------
-- Table: POSTE
------------------------------------------------------------*/
CREATE TABLE POSTE(
	ID_CASTING   INT  NOT NULL ,
	ID_ORG       INT  NOT NULL  ,
	CONSTRAINT POSTE_PK PRIMARY KEY (ID_CASTING,ID_ORG)

	,CONSTRAINT POSTE_CASTINGS_FK FOREIGN KEY (ID_CASTING) REFERENCES CASTINGS(ID_CASTING)
	,CONSTRAINT POSTE_ORGANISATION0_FK FOREIGN KEY (ID_ORG) REFERENCES ORGANISATION(ID_ORG)
);


/*------------------------------------------------------------
-- Table: A
------------------------------------------------------------*/
CREATE TABLE A(
	ID_ORG    INT  NOT NULL ,
	ID_PACK   INT  NOT NULL  ,
	CONSTRAINT A_PK PRIMARY KEY (ID_ORG,ID_PACK)

	,CONSTRAINT A_ORGANISATION_FK FOREIGN KEY (ID_ORG) REFERENCES ORGANISATION(ID_ORG)
	,CONSTRAINT A_PACK0_FK FOREIGN KEY (ID_PACK) REFERENCES PACK(ID_PACK)
);


/*------------------------------------------------------------
-- Table: Fournir
------------------------------------------------------------*/
CREATE TABLE Fournir(
	ID_USER       INT  NOT NULL ,
	ID_CIVILITE   INT  NOT NULL  ,
	CONSTRAINT Fournir_PK PRIMARY KEY (ID_USER,ID_CIVILITE)

	,CONSTRAINT Fournir_USER_FK FOREIGN KEY (ID_USER) REFERENCES USERS(ID_USER)
	,CONSTRAINT Fournir_CIVILITE0_FK FOREIGN KEY (ID_CIVILITE) REFERENCES CIVILITE(ID_CIVILITE)
);


/*------------------------------------------------------------
-- Table: Avoir
------------------------------------------------------------*/
CREATE TABLE Avoir(
	ID_CASTING   INT  NOT NULL ,
	ID_CAT       INT  NOT NULL  ,
	CONSTRAINT Avoir_PK PRIMARY KEY (ID_CASTING,ID_CAT)

	,CONSTRAINT Avoir_CASTINGS_FK FOREIGN KEY (ID_CASTING) REFERENCES CASTINGS(ID_CASTING)
	,CONSTRAINT Avoir_CATEGORIES0_FK FOREIGN KEY (ID_CAT) REFERENCES CATEGORIES(ID_CAT)
);


/*------------------------------------------------------------
-- Table: Appartenir
------------------------------------------------------------*/
CREATE TABLE Appartenir(
	ID_CASTING   INT  NOT NULL ,
	ID_FILTRE    INT  NOT NULL  ,
	CONSTRAINT Appartenir_PK PRIMARY KEY (ID_CASTING,ID_FILTRE)

	,CONSTRAINT Appartenir_CASTINGS_FK FOREIGN KEY (ID_CASTING) REFERENCES CASTINGS(ID_CASTING)
	,CONSTRAINT Appartenir_FILTRES0_FK FOREIGN KEY (ID_FILTRE) REFERENCES FILTRES(ID_FILTRE)
);


