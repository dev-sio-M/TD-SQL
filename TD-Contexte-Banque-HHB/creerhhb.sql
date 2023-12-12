
CREATE TABLE Agence(
   num_agence VARCHAR(50),
   nom_agence VARCHAR(50) NOT NULL,
   adresse_agence VARCHAR(50) NOT NULL,
   tel_agence INT,
   PRIMARY KEY(num_agence)
);

CREATE TABLE Client(
   num_client VARCHAR(50),
   nom_client VARCHAR(50) NOT NULL,
   prenom_client VARCHAR(50) NOT NULL,
   adresse_client VARCHAR(50) NOT NULL,
   identifiant_internet INT NOT NULL,
   mdp_internet VARCHAR(50) NOT NULL,
   PRIMARY KEY(num_client)
);

CREATE TABLE Dates(
   dates VARCHAR(50),
   PRIMARY KEY(dates)
);

CREATE TABLE Type_Compte(
   id_type VARCHAR(50),
   designation VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_type)
);

CREATE TABLE VirementProgrammes(
   numVirement VARCHAR(50),
   designation VARCHAR(50) NOT NULL,
   montant INT,
   numCompteCredite INT,
   numCompteDebite INT,
   dateExecution DATE,
   PRIMARY KEY(numVirement)
);

CREATE TABLE Conseiller(
   num_conseiller VARCHAR(50),
   nom_conseiller VARCHAR(50) NOT NULL,
   prenom_conseiller VARCHAR(50) NOT NULL,
   date_embauche DATE,
   PRIMARY KEY(num_conseiller)
);

CREATE TABLE Compte(
   num_compte VARCHAR(50),
   solde INT NOT NULL,
   id_type VARCHAR(50) NOT NULL,
   dates VARCHAR(50),
   dates_1 VARCHAR(50) NOT NULL,
   PRIMARY KEY(num_compte),
   FOREIGN KEY(id_type) REFERENCES Type_Compte(id_type),
   FOREIGN KEY(dates) REFERENCES Dates(dates),
   FOREIGN KEY(dates_1) REFERENCES Dates(dates)
);

CREATE TABLE Operation(
   id_operation VARCHAR(50),
   designation VARCHAR(50) NOT NULL,
   type_operation VARCHAR(50) NOT NULL,
   montant INT NOT NULL,
   dates VARCHAR(50) NOT NULL,
   num_compte VARCHAR(50),
   num_compte_1 VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_operation),
   UNIQUE(montant),
   FOREIGN KEY(dates) REFERENCES Dates(dates),
   FOREIGN KEY(num_compte) REFERENCES Compte(num_compte),
   FOREIGN KEY(num_compte_1) REFERENCES Compte(num_compte)
);

CREATE TABLE dependre(
   num_agence VARCHAR(50),
   num_client VARCHAR(50),
   dates VARCHAR(50),
   PRIMARY KEY(num_agence, num_client, dates),
   FOREIGN KEY(num_agence) REFERENCES Agence(num_agence),
   FOREIGN KEY(num_client) REFERENCES Client(num_client),
   FOREIGN KEY(dates) REFERENCES Dates(dates)
);

CREATE TABLE posseder(
   num_client VARCHAR(50),
   num_compte VARCHAR(50),
   PRIMARY KEY(num_client, num_compte),
   FOREIGN KEY(num_client) REFERENCES Client(num_client),
   FOREIGN KEY(num_compte) REFERENCES Compte(num_compte)
);

CREATE TABLE remunerer(
   dates VARCHAR(50),
   dates_1 VARCHAR(50),
   id_type VARCHAR(50),
   taux_interet VARCHAR(50),
   PRIMARY KEY(dates, dates_1, id_type),
   FOREIGN KEY(dates) REFERENCES Dates(dates),
   FOREIGN KEY(dates_1) REFERENCES Dates(dates),
   FOREIGN KEY(id_type) REFERENCES Type_Compte(id_type)
);

CREATE TABLE effectuer(
   num_compte VARCHAR(50),
   numVirement VARCHAR(50),
   PRIMARY KEY(num_compte, numVirement),
   FOREIGN KEY(num_compte) REFERENCES Compte(num_compte),
   FOREIGN KEY(numVirement) REFERENCES VirementProgrammes(numVirement)
);

CREATE TABLE Appeler(
   num_client VARCHAR(50),
   num_conseiller VARCHAR(50),
   PRIMARY KEY(num_client, num_conseiller),
   FOREIGN KEY(num_client) REFERENCES Client(num_client),
   FOREIGN KEY(num_conseiller) REFERENCES Conseiller(num_conseiller)
);


INSERT INTO Agence (num_agence, nom_agence, adresse_agence, tel_agence)
VALUES 
('101', 'Agence Centrale', '5 Rue Principale', 123456789),
('202', 'Agence Sud', '12 Avenue du Soleil', 987654321),
('303', 'Agence Nord', '8 Rue de Glace', 555444333),
('404', 'Agence Ouest', '20 Boulevard des Vents', 777888999),
('505', 'Agence Est', '15 Avenue de lAurore', 111222333);

INSERT INTO Client (num_client, nom_client, prenom_client, adresse_client, identifiant_internet, mdp_internet)
VALUES 
('1001', 'Dubois', 'Pierre', '10 Rue Client', 111, 'mdp123'),
('2002', 'Martin', 'Sophie', '20 Avenue Client', 222, 'secret567'),
('3003', 'Lefevre', 'Julie', '30 Rue des Fleurs', 333, 'mdp789'),
('4004', 'Moreau', 'Luc', '40 Boulevard Principal', 444, 'password12'),
('5005', 'Garcia', 'Emma', '50 Avenue du Centre', 555, 'mdp456');

INSERT INTO Dates (dates)
VALUES 
('2023-01-01'),
('2023-01-02'),
('2023-01-03'),
('2023-01-04'),
('2023-01-05');

INSERT INTO Type_Compte (id_type, designation)
VALUES 
('001', 'Compte Courant'),
('002', 'Compte Épargne'),
('003', 'Compte Jeunesse'),
('004', 'Compte Entreprise'),
('005', 'Compte Étudiant');

INSERT INTO VirementProgrammes (numVirement, designation, montant, numCompteCredite, numCompteDebite, dateExecution)
VALUES 
('VP001', 'Virement Loyer', 800, 101, 202, '2023-01-02'),
('VP002', 'Virement Épargne', 500, 303, 404, '2023-01-03'),
('VP003', 'Virement Mensuel', 300, 404, 505, '2023-01-04'),
('VP004', 'Virement Entreprises', 1000, 202, 101, '2023-01-05'),
('VP005', 'Virement Étudiant', 200, 303, 404, '2023-01-01');

INSERT INTO Conseiller (num_conseiller, nom_conseiller, prenom_conseiller, date_embauche)
VALUES 
('C001', 'Dupuis', 'Marc', '2022-05-15'),
('C002', 'Leroy', 'Sophie', '2023-01-10'),
('C003', 'Bertrand', 'Antoine', '2021-11-20'),
('C004', 'Fournier', 'Elise', '2022-09-30'),
('C005', 'Lambert', 'Caroline', '2023-03-05');

INSERT INTO Compte (num_compte, solde, id_type, dates, dates_1)
VALUES 
('C1001', 5000, '001', '2023-01-01', '2023-01-02'),
('C2002', 8000, '002', '2023-01-02', '2023-01-03'),
('C3003', 300, '003', '2023-01-03', '2023-01-04'),
('C4004', 15000, '004', '2023-01-04', '2023-01-05'),
('C5005', 1000, '005', '2023-01-05', '2023-01-01');

INSERT INTO Operation (id_operation, designation, type_operation, montant, dates, num_compte, num_compte_1)
VALUES 
('OP001', 'Paiement loyer', 'Débit', 800, '2023-01-01', 'C1001', 'C2002'),
('OP002', 'Virement Épargne', 'Crédit', 500, '2023-01-02', 'C2002', 'C3003'),
('OP003', 'Retrait', 'Débit', 200, '2023-01-03', 'C3003', 'C4004'),
('OP004', 'Virement Entreprises', 'Crédit', 1000, '2023-01-04', 'C4004', 'C1001'),
('OP005', 'Achat alimentation', 'Débit', 50, '2023-01-05', 'C5005', 'C1001');

INSERT INTO dependre (num_agence, num_client, dates)
VALUES 
('101', '1001', '2023-01-01'),
('202', '2002', '2023-01-02'),
('303', '3003', '2023-01-03'),
('404', '4004', '2023-01-04'),
('505', '5005', '2023-01-05');

INSERT INTO posseder (num_client, num_compte)
VALUES 
('1001', 'C1001'),
('2002', 'C2002'),
('3003', 'C3003'),
('4004', 'C4004'),
('5005', 'C5005');

INSERT INTO remunerer (dates, dates_1, id_type, taux_interet)
VALUES 
('2023-01-01', '2023-01-02', '001', '2%'),
('2023-01-02', '2023-01-03', '002', '3%'),
('2023-01-03', '2023-01-04', '003', '1.5%'),
('2023-01-04', '2023-01-05', '004', '4%'),
('2023-01-05', '2023-01-01', '005', '1.8%');

INSERT INTO effectuer (num_compte, numVirement)
VALUES 
('C1001', 'VP001'),
('C2002', 'VP002'),
('C3003', 'VP003'),
('C4004', 'VP004'),
('C5005', 'VP005');

INSERT INTO Appeler (num_client, num_conseiller)
VALUES 
('1001', 'C001'),
('2002', 'C002'),
('3003', 'C003'),
('4004', 'C004'),
('5005', 'C005');
