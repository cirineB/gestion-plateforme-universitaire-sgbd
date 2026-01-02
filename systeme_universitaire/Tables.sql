-- Script PostgreSQL minimal et strictement conforme à ton MLD
-- Crée les tables et les clés primaires / étrangères nécessaires (sans contraintes supplémentaires)

-- RESET (safe drop dans l'ordre des dépendances)
DROP TABLE IF EXISTS Evalue;
DROP TABLE IF EXISTS Examen;
DROP TABLE IF EXISTS Inscription;
DROP TABLE IF EXISTS Cours;
DROP TABLE IF EXISTS Enseignant;
DROP TABLE IF EXISTS Etudiant;

-- Table Etudiant
CREATE TABLE Etudiant (
    numero_etudiant   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom               VARCHAR(50),
    prenom            VARCHAR(50),
    dateNaissance     DATE,
    email             VARCHAR(100),
    numtel            VARCHAR(20),
    sexe              VARCHAR(10)
);

-- Table Enseignant
CREATE TABLE Enseignant (
    idEnseignant      INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom               VARCHAR(50),
    prenom            VARCHAR(50),
    dateNaissance     DATE,
    titre             VARCHAR(50),
    annee             INTEGER,
    email             VARCHAR(100),
    numtel            VARCHAR(20)
);

-- Table Cours
CREATE TABLE Cours (
    idCours           INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    date_Cours        DATE,
    heure_Cours       TIME,
    duree             REAL,
    coef              INTEGER,
    matiere           VARCHAR(100),
    salle             VARCHAR(50),
    idEnseignant      INTEGER,
    CONSTRAINT fk_cours_enseignant FOREIGN KEY (idEnseignant) REFERENCES Enseignant(idEnseignant)
);

-- Table Inscription
CREATE TABLE Inscription (
    idInscription     INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dateInscription   DATE,
    statut            VARCHAR(20),
    semestre          VARCHAR(10),
    anneeScolaire     VARCHAR(9),
    numero_etudiant   INTEGER,
    idCours           INTEGER,
    CONSTRAINT fk_inscription_etudiant FOREIGN KEY (numero_etudiant) REFERENCES Etudiant(numero_etudiant),
    CONSTRAINT fk_inscription_cours FOREIGN KEY (idCours) REFERENCES Cours(idCours)
);

-- Table Examen
CREATE TABLE Examen (
    idExamen          INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    intituleExam      VARCHAR(100),
    typeExam          VARCHAR(20),
    semestre          VARCHAR(10),
    anneeScolaire     VARCHAR(9),
    dateExam          DATE,
    salle             VARCHAR(20),
    duree             REAL,
    idCours           INTEGER,
    CONSTRAINT fk_examen_cours FOREIGN KEY (idCours) REFERENCES Cours(idCours)
);

-- Table Evalue (relation porteuse note)
CREATE TABLE Evalue (
    numero_etudiant   INTEGER,
    idExamen          INTEGER,
    note              REAL,
    PRIMARY KEY (numero_etudiant, idExamen),
    CONSTRAINT fk_evalue_etudiant FOREIGN KEY (numero_etudiant) REFERENCES Etudiant(numero_etudiant),
    CONSTRAINT fk_evalue_examen FOREIGN KEY (idExamen) REFERENCES Examen(idExamen)
);
