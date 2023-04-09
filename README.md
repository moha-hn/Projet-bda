# Projet-bda

Soit la base de données « Gestion des salles de sport »dont le schéma relationnel est donné ci‐ dessous :
VILLES (VILLE)
SPORTIFS (IDSPORTIF, NOM, PRENOM, SEXE, AGE, IDSPORTIFCONSEILLER*)
SPORTS (IDSPORT, LIBELLE)
GYMNASES (IDGYMNASE, NOMGYMNASE, ADRESSE, VILLE*, SURFACE)
ARBITRER (IDSPORTIF*, IDSPORT*)
ENTRAINER (IDSPORTIFENTRAINEUR*, IDSPORT*)
JOUER (IDSPORTIF*, IDSPORT*)
SEANCES (IDGYMNASE*, IDSPORT*, IDSPORTIFENTRAINEUR*, JOUR, HORAIRE, DUREE)

Dans ce schéma :
⎯ Les clés primaires sont soulignées et * représente une clé étrangère.
⎯ Les attributs commençant par ID sont des entiers.
⎯ Les attributs SEXE, ADRESSE, Ville sont des chaines de caractères
⎯ Le JOUR est une chaîne de caractères prise dans le domaine {’Samedi’,..., ’Vendredi’}.
⎯ L’attribut SEXE est une chaîne de caractères prise dans le domaine {’M’, ‘F’}.
⎯ La durée est en minute.
⎯ Horaire est un réel qui représente le début de la séance convertit en heure
