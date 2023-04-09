
select type_name,attributes from user_types;



/*table space*/
CREATE TABLESPACE SQL3_TBS2 
   DATAFILE 'c:\SQL3_TBS2.dbf' 
   SIZE 1g
   AUTOEXTEND ON NEXT 200M MAXSIZE UNLIMITED;

CREATE TEMPORARY TABLESPACE SQL3_TempTBS2
    tempfile 'c:\SQL3_TempTBS2.dat'
    size 100M 
    AUTOEXTEND ON NEXT 200M MAXSIZE UNLIMITED;

/*user*/
create user SQL3 
    identified by 1234 
    default tablespace SQL3_TBS2
    temporary tablespace SQL3_TempTBS2;

GRANT all privileges to SQL3;


/*creation type*/
/*ville*/
create or replace type tville as object(
    ville varchar2(50)
)
/

ALTER TYPE tville modify ATTRIBUTE ville VARCHAR2(50) cascade;

/*sportif*/
CREATE or replace TYPE tsportifs as object(
    IDSPORTIF integer,
    NOM varchar2(50),
    PRENOM varchar2(50),
    SEXE varchar(1) ,
    AGE integer
)Not Final;
/
CREATE TYPE tconseiller under tsportifs(
    IDSPORTIFCONSEILLER integer
);
/

CREATE TYPE tentraineur under tsportifs(
    IDSPORTIFENTRAINEUR integer
);
/



/*gymnase*/

CREATE TYPE tgymnases as object(
    IDGYMNASE integer,
    NOMGYMNASE varchar2(50),
    ADRESSE varchar2(50),
    VILLE ref tville,
    Surface integer  
);
/
create type t_set_ref_gymnases as table of ref tgymnases;
/
/*sport*/
create type tsports as object(
    IDSPORT integer,
    LIBELLE varchar2(50),
    gymnase t_set_ref_gymnases
);
/
create type t_set_ref_sports as table of ref tsports;
/
alter type tsportifs add attribute sport t_set_ref_sports cascade;


/*arbitrer*/

create type tarbitrer as object(
    sportif ref tsportifs,
    sport ref tsports
)
/


/*entrainer*/
create type tentrainer as object(
    entraineur ref tentraineur, 
    sport ref tsports
)
/


/*jouer*/
create type tjouer as object(
    sportif ref tsportifs,
    sport ref tsports
)
/



/*seance*/


CREATE TYPE tseance as object(
    gymnase ref tgymnases,
    sport ref tsports,
    entraineur ref tentraineur,
    JOUR varchar2(10),
    HORAIRE number,
    DUREE  integer
);
/






/*creation table*/
CREATE TABLE villes OF tville(
    primary key(ville)
);


CREATE TABLE sportifs OF tsportifs(
    primary key(idsportif),
    check (sexe in('M','F'))
)nested table sport store as nt_sportif_sport;

CREATE TABLE gymnases OF tgymnases(
    primary key(IDGYMNASE)
);

CREATE TABLE sports OF tsports(
    primary key(IDSPORT)
)nested table gymnase store as nt_sport_gymnase;



CREATE TABLE jouer OF tjouer(
    foreign key(sport) references sports,
    foreign key(sportif) references sportifs
);

CREATE TABLE arbitrer of  tarbitrer(
    foreign key(sport) references sports,
    foreign key(sportif) references sportifs
);
CREATE TABLE entrainer OF tentrainer(
    foreign key(sport) references sports,
    foreign key(entraineur) references sportifs
);

CREATE TABLE seances of tseance (
    foreign key(gymnase) references gymnases,
    foreign key(sport) references sports,
    foreign key(entraineur) references sportifs
);






--insertt

INSERT INTO gymnases VALUES (tgymnases(1,'Five Gym Club','Boulevard Mohamed 5',
    (select ref (v) from Villes v where ville='Alger centre'),
    200)
);
INSERT INTO Sports VALUES(tsports(1,'Basket ball',
    T_SET_REF_GYMNASES((select ref (g) from gymnases g where IDGYMNASE=1)
    )   
    )
);


INSERT INTO Sportifs VALUES(
    tconseiller(4,'LACHEMI','Bouzid','M',32,t_set_ref_sports(
    (select ref (s) from sports s where IDSPORT=1)
    ),1
    )
);
INSERT INTO Sportifs VALUES(
    65,'CHAADI','Mourad','M',NULL,t_set_ref_sports(
    (select ref (s) from sports s where IDSPORT=1)
    ),30
);
INSERT INTO Sportifs VALUES(65,'CHAADI','Mourad','M',30,NULL);


/*methodes*/
alter type tsportifs add member function nb_sports_entraines(p_id_sportif IN INTEGER)  return 
INTEGER cascade;
create or replace type body tsportifs
as member function nb_sports_entraines(p_id_sportif IN INTEGER)  return INTEGER
is
  v_nb_sports INTEGER;
BEGIN
  SELECT COUNT(*) INTO v_nb_sports
  FROM TABLE(SELECT s.gymnase FROM sportifs s, TABLE(s.sport) g WHERE s.idsportif = p_id_sportif);
  RETURN v_nb_sports;
END;
end;
/

CREATE OR REPLACE FUNCTION nb_sports_entraines(p_id_sportif IN INTEGER) RETURN INTEGER AS
  v_nb_sports INTEGER;
BEGIN
  SELECT COUNT(*) INTO v_nb_sports
  FROM TABLE(SELECT s.gymnase FROM sportifs s, TABLE(s.sport) g WHERE s.idsportif = p_id_sportif);
  RETURN v_nb_sports;
END;
/

CREATE OR REPLACE FUNCTION nb_gymnases_par_sport RETURN SYS_REFCURSOR AS
  c SYS_REFCURSOR;
BEGIN
  OPEN c FOR
  SELECT s.libelle, COUNT(DISTINCT g.idgymnase) nb_gymnases
  FROM sports s, TABLE(s.gymnase) g
  GROUP BY s.libelle;
  RETURN c;
END;
/


CREATE OR REPLACE FUNCTION moyenne_surface_gymnases_par_ville RETURN SYS_REFCURSOR AS
  c SYS_REFCURSOR;
BEGIN
  OPEN c FOR
  SELECT v.ville, AVG(g.surface) moyenne_surface
  FROM gymnases g, villes v
  WHERE g.ville = REF(v)
  GROUP BY v.ville;
  RETURN c;
END;
/



--select
SELECT DEREF(P.gymnase)
FROM sports P;
SELECT *
FROM THE (SELECT gymnase FROM sports) nt ;