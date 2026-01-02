-- 1. Étudiants n’ayant pas encore passé d’examens
SELECT * FROM Etudiant e
WHERE e.numero_etudiant NOT IN (SELECT numero_etudiant FROM Evalue);

-- 2. Nombre total d’étudiants inscrits
SELECT COUNT(*) AS total_etudiants FROM Etudiant;

-- 3. Étudiants ayant amélioré leur note entre deux semestres consécutifs
SELECT DISTINCT e1.numero_etudiant 
FROM Evalue e1
JOIN Examen ex1 ON e1.idExamen = ex1.idExamen
JOIN Evalue e2 ON e1.numero_etudiant = e2.numero_etudiant
JOIN Examen ex2 ON e2.idExamen = ex2.idExamen
WHERE 
    ex1.idCours = ex2.idCours  -- même cours
    AND substring(ex2.semestre, 2)::int = substring(ex1.semestre, 2)::int + 1
    AND e2.note > e1.note;

-- 4. Moyenne des notes par cours
SELECT c.matiere, AVG(ev.note) AS moyenne
FROM Evalue ev
JOIN Examen ex ON ev.idExamen = ex.idExamen
JOIN Cours c ON ex.idCours = c.idCours
GROUP BY c.matiere;

-- 5. Détails des enseignants encadrant des examens
SELECT ens.nom, ens.prenom, ex.intituleExam
FROM Enseignant ens
JOIN Cours c ON ens.idEnseignant = c.idEnseignant
JOIN Examen ex ON ex.idCours = c.idCours;

-- 6. Nombre total d’examens organisés par cours
SELECT c.matiere, COUNT(ex.idExamen) AS nb_examens
FROM Cours c
LEFT JOIN Examen ex ON c.idCours = ex.idCours
GROUP BY c.matiere;

-- 7. Répartition des étudiants par tranche d’âge
SELECT
    CASE
        WHEN AGE(CURRENT_DATE, dateNaissance) < INTERVAL '20 years' THEN 'Moins de 20 ans'
        WHEN AGE(CURRENT_DATE, dateNaissance) BETWEEN INTERVAL '20 years' AND INTERVAL '30 years' THEN '20-30 ans'
        ELSE 'Plus de 30 ans'
    END AS tranche_age,
    COUNT(*) AS nb_etudiants
FROM Etudiant
GROUP BY tranche_age;

-- 8. Étudiants avec moyenne générale > 15
SELECT e.numero_etudiant, e.nom, e.prenom, AVG(ev.note) AS moyenne_generale
FROM Evalue ev
JOIN Etudiant e ON ev.numero_etudiant = e.numero_etudiant
GROUP BY e.numero_etudiant 
HAVING AVG(ev.note) > 15;

-- 9. Enseignants sans cours
SELECT * FROM Enseignant
WHERE idEnseignant NOT IN (SELECT idEnseignant FROM Cours);

-- 10. Cours dispensés par un enseignant donné
SELECT c.*
FROM Cours c
JOIN Enseignant e ON c.idEnseignant = e.idEnseignant
WHERE e.nom = 'Dupont';

-- 11. Nombre d’inscriptions par cours (ordre décroissant)
SELECT c.matiere, COUNT(i.idInscription) AS nb_inscriptions
FROM Cours c
LEFT JOIN Inscription i ON c.idCours = i.idCours
GROUP BY c.matiere
ORDER BY nb_inscriptions DESC;

-- 12. Étudiants ayant obtenu la meilleure note à chaque examen
SELECT ex.idExamen, e.numero_etudiant, e.nom, e.prenom, ev.note
FROM Evalue ev
JOIN Etudiant e ON e.numero_etudiant = ev.numero_etudiant
JOIN Examen ex ON ex.idExamen = ev.idExamen
WHERE ev.note = (SELECT MAX(note) FROM Evalue WHERE idExamen = ex.idExamen);

-- 13. Inscriptions après une date donnée
SELECT * FROM Inscription
WHERE dateInscription > '2024-09-12';

-- 14. Nombre moyen d’inscriptions par étudiant
SELECT AVG(cnt) AS moyenne_inscriptions
FROM (
    SELECT COUNT(*) AS cnt
    FROM Inscription
    GROUP BY numero_etudiant
) t; -- t est le nom de la sous requête

-- 15. Inscriptions d’un étudiant donné
SELECT i.*
FROM Inscription i
JOIN Etudiant e ON i.numero_etudiant = e.numero_etudiant
WHERE e.nom = 'Lefevre' AND e.prenom = 'Emma';

-- 16. Étudiants inscrits à un cours spécifique
SELECT e.*
FROM Etudiant e
JOIN Inscription i ON e.numero_etudiant = i.numero_etudiant
JOIN Cours c ON i.idCours = c.idCours
WHERE c.matiere = 'Base de Données';

-- 17. Évolution du nombre d’inscriptions par mois
SELECT EXTRACT(MONTH FROM dateInscription) AS mois, COUNT(*) AS nb_inscriptions
FROM Inscription
WHERE anneeScolaire = '2024-2025'
GROUP BY mois
ORDER BY mois;

-- 18. Moyenne des étudiants par cours
SELECT e.numero_etudiant, e.nom, e.prenom, c.matiere, AVG(ev.note) AS moyenne
FROM Evalue ev
JOIN Examen ex ON ev.idExamen = ex.idExamen
JOIN Cours c ON ex.idCours = c.idCours
JOIN Etudiant e ON e.numero_etudiant = ev.numero_etudiant
GROUP BY e.numero_etudiant, e.nom, e.prenom, c.matiere;

-- 19. Étudiants inscrits à plus de 3 cours
SELECT numero_etudiant, COUNT(DISTINCT idCours) AS nb_cours
FROM Inscription
GROUP BY numero_etudiant
HAVING COUNT(DISTINCT idCours) > 3;

-- 20. Enseignants et leurs cours
SELECT e.nom, e.prenom, c.matiere
FROM Enseignant e
JOIN Cours c ON e.idEnseignant = c.idEnseignant;

-- 21. Inscriptions annulées ou supprimées
SELECT * FROM Inscription
WHERE statut ILIKE 'annulée' OR statut ILIKE 'supprimée';--ilike : ignore la casse

-- 22. Enseignant avec le plus de cours
SELECT e.nom, e.prenom, COUNT(c.idCours) AS nb_cours
FROM Enseignant e
JOIN Cours c ON e.idEnseignant = c.idEnseignant
GROUP BY e.nom, e.prenom
ORDER BY nb_cours DESC
LIMIT 1;

-- 23. Liste de tous les étudiants (infos basiques)
SELECT nom, prenom, dateNaissance, email FROM Etudiant;

-- 24. Cours + nombre total d’inscriptions
SELECT c.matiere, COUNT(i.idInscription) AS nb_inscriptions
FROM Cours c
LEFT JOIN Inscription i ON c.idCours = i.idCours
GROUP BY c.matiere;

-- 25. Cours avec plus de 50 étudiant inscrit
SELECT c.matiere
FROM Cours c
JOIN Inscription i ON c.idCours = i.idCours
GROUP BY c.matiere
HAVING COUNT(DISTINCT i.numero_etudiant) > 50;

-- 26. Cours avec taux de réussite le plus élevé (note >= 10)
SELECT c.matiere, COUNT(ev.note) FILTER (WHERE ev.note >= 10) * 100.0 / COUNT(ev.note) AS taux_reussite
FROM Evalue ev
JOIN Examen ex ON ev.idExamen = ex.idExamen
JOIN Cours c ON ex.idCours = c.idCours
GROUP BY c.matiere
ORDER BY taux_reussite DESC;

-- 27. Nombre d’inscriptions annulées par mois
SELECT EXTRACT(MONTH FROM dateInscription) AS mois, COUNT(*) AS nb_annulees
FROM Inscription
WHERE statut ILIKE 'annulée'
GROUP BY mois;

-- 28. Étudiants inscrits à tous les cours d’un enseignant donné
SELECT e.numero_etudiant, e.nom, e.prenom
FROM Etudiant e
JOIN Inscription i ON e.numero_etudiant = i.numero_etudiant
JOIN Cours c ON i.idCours = c.idCours
JOIN Enseignant ens ON ens.idEnseignant = c.idEnseignant
WHERE ens.nom = 'Dupont'
GROUP BY e.numero_etudiant, e.nom, e.prenom
HAVING COUNT(DISTINCT c.idCours) =
(
    SELECT COUNT(*)
    FROM Cours c2
    JOIN Enseignant ens2 ON ens2.idEnseignant = c2.idEnseignant
    WHERE ens2.nom = 'Dupont'
);

-- 29. Étudiants, cours et enseignants pour chaque inscription
SELECT et.nom, et.prenom, c.matiere, ens.nom AS enseignant
FROM Inscription i
JOIN Etudiant et ON i.numero_etudiant = et.numero_etudiant
JOIN Cours c ON i.idCours = c.idCours
JOIN Enseignant ens ON c.idEnseignant = ens.idEnseignant;

-- 30. Cours où la moyenne des notes < 12
SELECT c.matiere, AVG(ev.note) AS moyenne
FROM Evalue ev
JOIN Examen ex ON ev.idExamen = ex.idExamen
JOIN Cours c ON ex.idCours = c.idCours
GROUP BY c.matiere
HAVING AVG(ev.note) < 12;

-- 31. Date d’inscription de chaque étudiant pour chaque cours
SELECT e.nom, e.prenom, c.matiere, i.dateInscription
FROM Inscription i
JOIN Etudiant e ON i.numero_etudiant = e.numero_etudiant
JOIN Cours c ON i.idCours = c.idCours;

-- 32. Étudiants ayant passé un examen donné
SELECT e.nom, e.prenom
FROM Etudiant e
JOIN Evalue ev ON e.numero_etudiant = ev.numero_etudiant
JOIN Examen ex ON ev.idExamen = ex.idExamen
WHERE ex.intituleExam = 'Examen BD S1';

-- 33. Notes des étudiants pour un cours donné
SELECT e.nom, e.prenom, ev.note
FROM Evalue ev
JOIN Examen ex ON ev.idExamen = ex.idExamen
JOIN Cours c ON ex.idCours = c.idCours
JOIN Etudiant e ON ev.numero_etudiant = e.numero_etudiant
WHERE c.matiere = 'Base de Données';

-- 34. Tous les examens d’un cours donné
SELECT * 
FROM Examen ex
JOIN Cours c ON ex.idCours = c.idCours
WHERE c.matiere = 'Base de Données';

-- 35. Tous les cours + enseignant responsable
SELECT c.matiere, e.nom AS enseignant
FROM Cours c
JOIN Enseignant e ON c.idEnseignant = e.idEnseignant;

-- 36. Enseignants et nombre d’étudiants inscrits dans leurs cours
SELECT ens.nom, ens.prenom, COUNT(DISTINCT i.numero_etudiant) AS nb_etudiants
FROM Enseignant ens
JOIN Cours c ON ens.idEnseignant = c.idEnseignant
JOIN Inscription i ON i.idCours = c.idCours
GROUP BY ens.nom, ens.prenom;

-- 37. Cours sans inscriptions 
SELECT c.*
FROM Cours c
WHERE c.idCours NOT IN (SELECT idCours FROM Inscription);

-- 38. Moyenne des notes par enseignant
SELECT ens.nom, ens.prenom, AVG(ev.note) AS moyenne
FROM Enseignant ens
JOIN Cours c ON ens.idEnseignant = c.idEnseignant
JOIN Examen ex ON c.idCours = ex.idCours
JOIN Evalue ev ON ev.idExamen = ex.idExamen
GROUP BY ens.nom, ens.prenom;

-- 39. Étudiants ayant échoué à un examen donné
SELECT e.nom, e.prenom, ev.note
FROM Evalue ev                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
JOIN Etudiant e ON ev.numero_etudiant = e.numero_etudiant
JOIN Examen ex ON ev.idExamen = ex.idExamen
WHERE ex.intituleExam = 'Examen BD S1' AND ev.note < 10;

-- 40. Nombre total de cours par enseignant
SELECT e.nom, e.prenom, COUNT(c.idCours) AS nb_cours
FROM Enseignant e
LEFT JOIN Cours c ON e.idEnseignant = c.idEnseignant
GROUP BY e.nom, e.prenom;

-- 41. Cours dispensés par un enseignant donné
SELECT c.*
FROM Cours c
JOIN Enseignant e ON c.idEnseignant = e.idEnseignant
WHERE e.nom = 'Dupont';