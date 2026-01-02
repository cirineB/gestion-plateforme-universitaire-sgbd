# Gestion de plateforme universitaire – PostgreSQL (SGBD)

## Description
Ce projet consiste à concevoir et implémenter une base de données relationnelle pour la gestion d’une plateforme universitaire.  
Il permet de gérer :
- les étudiants
- les enseignants
- les cours
- les inscriptions
- les examens
- les notes et évaluations

Le projet est réalisé en **PostgreSQL** et respecte une séparation claire entre :
- la structure de la base de données
- les données insérées
- les requêtes SQL d’exploitation

---

## Modèle de données
La base de données repose sur les entités suivantes :
- **Etudiant**
- **Enseignant**
- **Cours**
- **Inscription**
- **Examen**
- **Evalue** (relation porteuse de la note)

Les relations entre les entités sont assurées par des clés primaires et des clés étrangères conformément au modèle logique de données (MLD).

---

## Structure du projet
database/
├── Tables.sql -- Création des tables et des contraintes (PK / FK)
├── insertion.sql -- Insertion des données (étudiants, enseignants, cours, inscriptions, examens, notes)
└── requetes.sql -- Requêtes SQL d’exploitation (SELECT)


---

## Installation et exécution

### Création de la base de données
Dans PostgreSQL :
```sql
CREATE DATABASE universite;

Exécution des scripts

Exécuter les fichiers dans l’ordre suivant :
\i Tables.sql
\i insertion.sql
\i requetes.sql

Technologies utilisées

PostgreSQL : Système de gestion de base de données relationnelle

SQL : Langage de manipulation et de requête des données
