-- ===============================
--  INSERTIONS COMPLETES
-- ===============================

-- TABLE : Enseignant
INSERT INTO Enseignant (nom, prenom, dateNaissance, titre, annee, email, numtel) VALUES
('Dupont', 'Marc', '1975-06-12', 'Professeur', 2020, 'marc.dupont@univ.com', '0612345678'),
('Martin', 'Sophie', '1980-03-21', 'Maître de conférences', 2019, 'sophie.martin@univ.com', '0623456789'),
('Bernard', 'Luc', '1968-09-15', 'Chargé de cours', 2021, 'luc.bernard@univ.com', '0634567890'),
('Durand', 'Claire', '1985-01-07', 'Professeur', 2022, 'claire.durand@univ.com', '0645678901'),
('Petit', 'Adrien', '1978-04-19', 'Maître de conférences', 2023, 'adrien.petit@univ.com', '0678901234');


-- TABLE : Etudiant
INSERT INTO Etudiant (nom, prenom, dateNaissance, email, numtel, sexe) VALUES
('Lefevre', 'Emma', '2002-04-11', 'emma.lefevre@etu.univ.com', '0611223344', 'F'),
('Moreau', 'Lucas', '2001-08-23', 'lucas.moreau@etu.univ.com', '0622334455', 'M'),
('Simon', 'Chloe', '2003-02-16', 'chloe.simon@etu.univ.com', '0633445566', 'F'),
('Roux', 'Hugo', '2000-12-09', 'hugo.roux@etu.univ.com', '0644556677', 'M'),
('Fontaine', 'Lina', '2004-06-01', 'lina.fontaine@etu.univ.com', '0655667788', 'F'),
('Garcia', 'Noah', '2002-11-20', 'noah.garcia@etu.univ.com', '0666778899', 'M'),
('Blanc', 'Tom', '2003-09-12', 'tom.blanc@etu.univ.com', '0670000000', 'M');

-- TABLE : Cours
INSERT INTO Cours (date_Cours, heure_Cours, duree, coef, matiere, salle, idEnseignant) VALUES
('2024-10-02', '08:00', 2, 3, 'Base de Données', 'B101', 1),
('2024-10-03', '10:00', 2, 2, 'Programmation Python', 'B202', 2),
('2024-10-04', '13:00', 3, 4, 'Algorithmique', 'B303', 1),
('2024-10-05', '15:00', 2, 2, 'Systèmes dExploitation', 'B404', 3),
('2024-10-06', '09:00', 3, 3, 'Réseaux Informatiques', 'B505', 4),
('2024-10-07', '11:00', 2, 2, 'Sécurité Informatique', 'B606', 4),
('2024-10-09', '08:00', 2, 3, 'sgbd', 'B101', 1),
('2024-11-10', '16:00', 2, 1, 'Cours Sans Inscription', 'C707', 2);

-- TABLE : Inscription
INSERT INTO Inscription (dateInscription, statut, semestre, anneeScolaire, numero_etudiant, idCours) VALUES
('2024-09-10', 'Active', 'S1', '2024-2025', 1, 1),
('2024-09-11', 'Active', 'S1', '2024-2025', 1, 2),
('2024-09-12', 'Active', 'S1', '2024-2025', 2, 1),
('2024-09-13', 'Active', 'S1', '2024-2025', 2, 3),
('2024-09-14', 'Annulée', 'S1', '2024-2025', 3, 4),
('2024-09-15', 'Active', 'S1', '2024-2025', 3, 2),
('2024-09-16', 'Active', 'S1', '2024-2025', 4, 5),
('2024-09-17', 'Active', 'S1', '2024-2025', 5, 3),
('2024-09-18', 'Active', 'S1', '2024-2025', 6, 1),
('2024-09-19', 'Active', 'S1', '2024-2025', 3, 6),

('2024-10-10', 'Active', 'S1', '2024-2025', 7, 2),
('2024-09-20', 'Active', 'S1', '2024-2025', 1, 3),
('2024-09-21', 'Active', 'S1', '2024-2025', 1, 5),
('2024-09-22', 'Active', 'S1', '2024-2025', 1, 3),
('2024-09-26', 'Active', 'S1', '2024-2025', 1, 7);

-- TABLE : Examen
INSERT INTO Examen (intituleExam, typeExam, semestre, anneeScolaire, dateExam, salle, duree, idCours) VALUES
('Examen BD S1', 'Final', 'S1', '2024-2025', '2024-12-20', 'B101', 2, 1),
('Examen Python S1', 'Final', 'S1', '2024-2025', '2024-12-21', 'B202', 2, 2),
('Examen Algo S1', 'Partiel', 'S1', '2024-2025', '2024-12-22', 'B303', 1.5, 3),
('Examen Réseaux S1', 'Final', 'S1', '2024-2025', '2024-12-23', 'B505', 2, 5),
('Examen Sécurité S1', 'Final', 'S1', '2024-2025', '2024-12-24', 'B606', 2, 6),
('Examen BD S2', 'Final', 'S2', '2024-2025', '2025-06-20', 'B101', 2, 1),
('Examen Python S2', 'Final', 'S2', '2024-2025', '2025-06-21', 'B202', 2, 2);



-- TABLE : Evalue
INSERT INTO Evalue (numero_etudiant, idExamen, note) VALUES
(1, 1, 15.5),
(1, 2, 14.0),
(2, 1, 12.0),
(2, 3, 16.5),
(3, 2, 10.5),
(3, 4, 13.0),
(4, 1, 9.5),
(4, 4, 11.0),
(5, 3, 17.0),
(6, 1, 8.0),

(5, 1, 11.5),
(5, 2, 12.5),
(5, 4, 14.0),

(6, 2, 9.0),
(6, 3, 12.0),

(3, 5, 15.0),
(4, 5, 13.5),
(6, 5, 10.0),
(1, 6, 16.0),  -- Emma Lefevre améliore sa note en Base de Données
(2, 6, 13.0),  -- Lucas Moreau améliore sa note en Base de Données
(3, 7, 12.0);  -- Chloe Simon améliore sa note en Python




-- Ajout de 50 nouveaux étudiants
INSERT INTO Etudiant (nom, prenom, dateNaissance, email, numtel, sexe)
VALUES
('Test1', 'User1', '2000-01-01', 'test1@etu.com', '0700000001', 'M'),
('Test2', 'User2', '2000-01-02', 'test2@etu.com', '0700000002', 'F'),
('Test3', 'User3', '2000-01-03', 'test3@etu.com', '0700000003', 'M'),
('Test4', 'User4', '2000-01-04', 'test4@etu.com', '0700000004', 'F'),
('Test5', 'User5', '2000-01-05', 'test5@etu.com', '0700000005', 'M'),
('Test6', 'User6', '2000-01-06', 'test6@etu.com', '0700000006', 'F'),
('Test7', 'User7', '2000-01-07', 'test7@etu.com', '0700000007', 'M'),
('Test8', 'User8', '2000-01-08', 'test8@etu.com', '0700000008', 'F'),
('Test9', 'User9', '2000-01-09', 'test9@etu.com', '0700000009', 'M'),
('Test10', 'User10', '2000-01-10', 'test10@etu.com', '0700000010', 'F'),
('Test11', 'User11', '2000-01-11', 'test11@etu.com', '0700000011', 'M'),
('Test12', 'User12', '2000-01-12', 'test12@etu.com', '0700000012', 'F'),
('Test13', 'User13', '2000-01-13', 'test13@etu.com', '0700000013', 'M'),
('Test14', 'User14', '2000-01-14', 'test14@etu.com', '0700000014', 'F'),
('Test15', 'User15', '2000-01-15', 'test15@etu.com', '0700000015', 'M'),
('Test16', 'User16', '2000-01-16', 'test16@etu.com', '0700000016', 'F'),
('Test17', 'User17', '2000-01-17', 'test17@etu.com', '0700000017', 'M'),
('Test18', 'User18', '2000-01-18', 'test18@etu.com', '0700000018', 'F'),
('Test19', 'User19', '2000-01-19', 'test19@etu.com', '0700000019', 'M'),
('Test20', 'User20', '2000-01-20', 'test20@etu.com', '0700000020', 'F'),
('Test21', 'User21', '2000-01-21', 'test21@etu.com', '0700000021', 'M'),
('Test22', 'User22', '2000-01-22', 'test22@etu.com', '0700000022', 'F'),
('Test23', 'User23', '2000-01-23', 'test23@etu.com', '0700000023', 'M'),
('Test24', 'User24', '2000-01-24', 'test24@etu.com', '0700000024', 'F'),
('Test25', 'User25', '2000-01-25', 'test25@etu.com', '0700000025', 'M'),
('Test26', 'User26', '2000-01-26', 'test26@etu.com', '0700000026', 'F'),
('Test27', 'User27', '2000-01-27', 'test27@etu.com', '0700000027', 'M'),
('Test28', 'User28', '2000-01-28', 'test28@etu.com', '0700000028', 'F'),
('Test29', 'User29', '2000-01-29', 'test29@etu.com', '0700000029', 'M'),
('Test30', 'User30', '2000-01-30', 'test30@etu.com', '0700000030', 'F'),
('Test31', 'User31', '2000-01-31', 'test31@etu.com', '0700000031', 'M'),
('Test32', 'User32', '2000-02-01', 'test32@etu.com', '0700000032', 'F'),
('Test33', 'User33', '2000-02-02', 'test33@etu.com', '0700000033', 'M'),
('Test34', 'User34', '2000-02-03', 'test34@etu.com', '0700000034', 'F'),
('Test35', 'User35', '2000-02-04', 'test35@etu.com', '0700000035', 'M'),
('Test36', 'User36', '2000-02-05', 'test36@etu.com', '0700000036', 'F'),
('Test37', 'User37', '2000-02-06', 'test37@etu.com', '0700000037', 'M'),
('Test38', 'User38', '2000-02-07', 'test38@etu.com', '0700000038', 'F'),
('Test39', 'User39', '2000-02-08', 'test39@etu.com', '0700000039', 'M'),
('Test40', 'User40', '2000-02-09', 'test40@etu.com', '0700000040', 'F'),
('Test41', 'User41', '2000-02-10', 'test41@etu.com', '0700000041', 'M'),
('Test42', 'User42', '2000-02-11', 'test42@etu.com', '0700000042', 'F'),
('Test43', 'User43', '2000-02-12', 'test43@etu.com', '0700000043', 'M'),
('Test44', 'User44', '2000-02-13', 'test44@etu.com', '0700000044', 'F'),
('Test45', 'User45', '2000-02-14', 'test45@etu.com', '0700000045', 'M'),
('Test46', 'User46', '2000-02-15', 'test46@etu.com', '0700000046', 'F'),
('Test47', 'User47', '2000-02-16', 'test47@etu.com', '0700000047', 'M'),
('Test48', 'User48', '2000-02-17', 'test48@etu.com', '0700000048', 'F'),
('Test49', 'User49', '2000-02-18', 'test49@etu.com', '0700000049', 'M'),
('Test50', 'User50', '2000-02-19', 'test50@etu.com', '0700000050', 'F');
-- Inscription des 50 nouveaux étudiants au même cours pour dépasser le seuil des 50
INSERT INTO Inscription (dateInscription, statut, semestre, anneeScolaire, numero_etudiant, idCours)
SELECT '2024-10-30', 'Active', 'S1', '2024-2025', numero_etudiant, 1
FROM Etudiant
WHERE numero_etudiant >= 8;   -- car tes 7 premiers étudiants existent déjà
