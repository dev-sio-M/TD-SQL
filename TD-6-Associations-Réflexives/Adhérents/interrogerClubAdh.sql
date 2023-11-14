use clubAdh ; 

/*Nom et prénom des adhérents qui n'ont pas de parrain*/
SELECT Nom, Prenom
FROM Adherents
WHERE Parrain IS NULL;

/*Nombre d'adhérents parrainés dont le parrain est identifié par le numéro 2*/
SELECT COUNT(*) AS NbAdhParraines
FROM Adherents
WHERE Parrain = 2;

/*Nombre d'adhérents parrainés par parrain*/
SELECT Parrain, COUNT(*) AS NbAdhParraines
FROM Adherents
WHERE Parrain IS NOT NULL
GROUP BY Parrain;


/*Nom et prénom des adhérents parrainés avec pour chacun d'eux le nom et le prénom du parrain*/
SELECT Adherents.Nom, Adherents.Prenom, Parrains.Nom AS NomParrain, Parrains.Prenom AS PrenomParrain
FROM Adherents
LEFT JOIN Adherents AS Parrains ON Adherents.Parrain = Parrains.Numero
WHERE Adherents.Parrain IS NOT NULL
ORDER BY Adherents.Nom, Adherents.Prenom;


/*Nom et prénom de tous les adhérents avec pour chaque adhérent parrainé le nom et le prénom de son parrain*/
SELECT Adherents.Nom, Adherents.Prenom, Parrains.Nom AS NomParrain, Parrains.Prenom AS PrenomParrain
FROM Adherents
LEFT JOIN Adherents AS Parrains ON Adherents.Parrain = Parrains.Numero
ORDER BY Adherents.Nom, Adherents.Prenom;


/*Nom et prénom du parrain le plus prolifique*/
SELECT Nom, Prenom
FROM Adherents
WHERE Numero = (
    SELECT Parrain
    FROM Adherents
    WHERE Parrain IS NOT NULL
);
