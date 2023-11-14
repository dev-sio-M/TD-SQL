use clubChv;

/*Nom du ou des géniteurs du cheval identifié par le numéro 33*/
SELECT Pere.Nom AS NomPere, Mere.Nom AS NomMere
FROM Cheveaux AS Cheval
LEFT JOIN Cheveaux AS Pere ON Cheval.Père = Pere.Identifiant
LEFT JOIN Cheveaux AS Mere ON Cheval.Mère = Mere.Identifiant
WHERE Cheval.Identifiant = 33;


/*Nom des chevaux dont le géniteur est le numéro 23*/
SELECT Cheveaux.Nom
FROM Cheveaux
WHERE Cheveaux.Père = 23;


/*Nom des chevaux dont on ne connait pas les deux géniteurs*/
SELECT Nom
FROM Cheveaux
WHERE Père IS NULL AND Mère IS NULL;


/*Nom de chaque cheval, et quand cela est possible, le nom de son ou de ses geniteurs*/
SELECT Cheval.Nom AS Nom_Cheval, Pere.Nom AS Nom_Pere,Mere.Nom AS Nom_Mere
FROM Cheveaux AS Cheval
LEFT JOIN Cheveaux AS Pere ON Cheval.Père = Pere.Identifiant
LEFT JOIN Cheveaux AS Mere ON Cheval.Mère = Mere.Identifiant;
