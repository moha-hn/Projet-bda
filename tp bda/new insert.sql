--villes
INSERT INTO Villes VALUES('Alger centre');
INSERT INTO Villes VALUES('Les sources');
INSERT INTO Villes VALUES('Belouizdad');
INSERT INTO Villes VALUES('Sidi Mhamed');
INSERT INTO Villes VALUES('El Biar');
INSERT INTO Villes VALUES('El Mouradia');
INSERT INTO Villes VALUES('Hydra');
INSERT INTO Villes VALUES('Dely Brahim');
INSERT INTO Villes VALUES('Kouba');
INSERT INTO Villes VALUES('Bir Mourad Raïs');
INSERT INTO Villes VALUES('Birkhadem');
INSERT INTO Villes VALUES('El Achour');
INSERT INTO Villes VALUES('Bordj el kiffan');
INSERT INTO Villes VALUES('Baba hassen');
INSERT INTO Villes VALUES('Chéraga');
INSERT INTO Villes VALUES('Alger');
INSERT INTO Villes VALUES('Hussein Dey');
INSERT INTO Villes VALUES('Béni Messous');
INSERT INTO Villes VALUES('Bordj El Bahri');
INSERT INTO Villes VALUES('Centre commercial-Mohamadia mall');


--gymnases
INSERT INTO gymnases VALUES (tgymnases(1,'Five Gym Club','Boulevard Mohamed 5',
    (select ref (v) from Villes v where ville='Alger centre'),
    200)
);
INSERT INTO gymnases VALUES (
    tgymnases(2, 'Mina Sport', '28 impasse musette les sources',
        (select ref(v) from Villes v where ville='Les sources'),
        450
    )
);

INSERT INTO gymnases VALUES (
    tgymnases(3, 'Aït Saada', 'Belouizdad',
        (select ref(v) from Villes v where ville='Belouizdad'),
        400
    )
);

INSERT INTO gymnases VALUES (
    tgymnases(4, 'Bahri Gym', 'Rue Mohamed Benzineb',
        (select ref(v) from Villes v where ville='Sidi Mhamed'),
        500
    )
);

INSERT INTO gymnases VALUES (
    tgymnases(5, 'Ladies First', '3 Rue Diar Naama N° 03',
        (select ref(v) from Villes v where ville='El Biar'),
        620
    )
);

INSERT INTO gymnases VALUES (
    tgymnases(6, 'C.T.F Club', 'Rue Sylvain FOURASTIER',
        (select ref(v) from Villes v where ville='El Mouradia'),
        400
    )
);

INSERT INTO gymnases VALUES (
    tgymnases(7, 'Body Fitness Center', 'Rue Rabah Takdjourt',
        (select ref(v) from Villes v where ville='Alger centre'),
        360
    )
);

INSERT INTO gymnases VALUES (
    tgymnases(8, 'Club Hydra Forme', 'Rue de l''Oasis',
        (select ref(v) from Villes v where ville='Hydra'),
        420
    )
);

INSERT INTO gymnases VALUES (
    tgymnases(9, 'Profitness Dely Brahim', '26 Bois des Cars 3',
        (select ref(v) from Villes v where ville='Dely Brahim'),
        620
    )
);

INSERT INTO gymnases VALUES (
    tgymnases(10, 'CLUB SIFAKS', 'Rue Ben Omar 31',
        (select ref(v) from Villes v where ville='Kouba'),
        400
    )
);

INSERT INTO gymnases VALUES (
    tgymnases(11, 'Gym ZAAF Club', '19 Ave Merabet Athmane',
        (select ref(v) from Villes v where ville='El Mouradia'),
        300
    )
);

INSERT INTO gymnases VALUES (
    tgymnases(12, 'GYM power', 'villa N°2, Chemin Said Hamdine',
        (select ref(v) from Villes v where ville='Bir Mourad Raïs'),
        480
    )
);

INSERT INTO gymnases VALUES (
    tgymnases(13, 'Icosium sport', 'Rue ICOSUM',
        (select ref(v) from Villes v where ville='Hydra'),
        200
    )
);

INSERT INTO gymnases VALUES (
    tgymnases(14, 'GIGA Fitness', 'res, Rue Hamoum Tahar',
        (select ref(v) from Villes v where ville='Birkhadem'),
        500
    )
);

INSERT INTO gymnases VALUES (tgymnases(15,'AC Fitness Et Aqua','Lotissement FAHS lot A n 12 parcelle 26',
(select ref(v) from Villes v where ville='Birkhadem'),
400)
);

INSERT INTO gymnases VALUES (tgymnases(16,'MELIA GYM','Résidence les deux bassins Sahraoui local N° 03',
(select ref(v) from Villes v where ville='El Achour'),
600)
);

INSERT INTO gymnases VALUES (tgymnases(17,'Sam Gym Power','Rue Mahdoud BENKHOUDJA',
(select ref(v) from Villes v where ville='Kouba'),
400)
);

INSERT INTO gymnases VALUES (tgymnases(18,'AQUAFORTLAND SPA','Bordj el kiffan',
(select ref(v) from Villes v where ville='Bordj el kiffan'),
450)
);

INSERT INTO gymnases VALUES (tgymnases(19,'GoFitness','Lotissement el louz n°264',
(select ref(v) from Villes v where ville='Baba hassen'),
500)
);

INSERT INTO gymnases VALUES (tgymnases(20,'Best Body Gym','Cité Alioua Fodil',
(select ref(v) from Villes v where ville='Chéraga'),
400)
);

INSERT INTO gymnases VALUES (tgymnases(21,'Power house gym','Cooperative Amina 02 Lot 15',
(select ref(v) from Villes v where ville='Alger'),
400)
);

INSERT INTO gymnases VALUES (tgymnases(22,'POWER ZONE GYM','Chemin Fernane Hanafi',
(select ref(v) from Villes v where ville='Hussein Dey'),
500)
);

INSERT INTO gymnases VALUES (tgymnases(23,'World Gym','14 Boulevard Ibrahim Hadjress',
(select ref(v) from Villes v where ville='Béni Messous'),
520)
);

INSERT INTO gymnases VALUES (tgymnases(24,'Moving Club','Bordj El Bahri',
(select ref(v) from Villes v where ville='Bordj El Bahri'),
450)
);

INSERT INTO gymnases VALUES (tgymnases(25,'Tiger gym','Route de Bouchaoui',
(select ref(v) from Villes v where ville='Chéraga'),
620)
);

INSERT INTO gymnases VALUES (tgymnases(26,'Lion CrossFit','Centre commercial-Mohamadia mall',
(select ref(v) from Villes v where ville='Mohammadia'),
600)
);

INSERT INTO gymnases VALUES (tgymnases(27,'Étoile sportive','Saoula',
(select ref(v) from Villes v where ville='Saoula'),
350)
);

INSERT INTO gymnases VALUES (tgymnases(28,'Fitness life gym','El Harrach',
(select ref(v) from Villes v where ville='El Harrach'),
400)
);

--sports
INSERT INTO Sports VALUES(
    tsports(1, 'Basket ball',
        T_SET_REF_GYMNASES((select ref(g) from Gymnases g where IDGYMNASE=1))
    )
);

INSERT INTO Sports VALUES(
    tsports(2, 'Volley ball',
        T_SET_REF_GYMNASES((select ref(g) from Gymnases g where IDGYMNASE=1))
    )
);

INSERT INTO Sports VALUES(
    tsports(3, 'Hand ball',
        T_SET_REF_GYMNASES((select ref(g) from Gymnases g where IDGYMNASE=2))
    )
);

INSERT INTO Sports VALUES(
    tsports(4, 'Tennis',
        T_SET_REF_GYMNASES((select ref(g) from Gymnases g where IDGYMNASE=2))
    )
);

INSERT INTO Sports VALUES(
    tsports(5, 'Hockey',
        T_SET_REF_GYMNASES((select ref(g) from Gymnases g where IDGYMNASE=3))
    )
);

INSERT INTO Sports VALUES(
    tsports(6, 'Badmington',
        T_SET_REF_GYMNASES((select ref(g) from Gymnases g where IDGYMNASE=4))
    )
);

INSERT INTO Sports VALUES(
    tsports(7, 'Ping pong',
        T_SET_REF_GYMNASES((select ref(g) from Gymnases g where IDGYMNASE=5))
    )
);

INSERT INTO Sports VALUES(
    tsports(8, 'Football',
        T_SET_REF_GYMNASES((select ref(g) from Gymnases g where IDGYMNASE=6))
    )
);

INSERT INTO Sports VALUES(
    tsports(9, 'Boxe',
        T_SET_REF_GYMNASES((select ref(g) from Gymnases g where IDGYMNASE=7))
    )
);
