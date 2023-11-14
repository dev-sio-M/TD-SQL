DROP DATABASE IF EXISTS clubAdh;

create database clubAdh;

use clubAdh;

create table Adherents (
    Numero INTEGER NOT NULL,
    Nom Varchar(30) NOT NULL,
    Prenom Varchar(30) NOT NULL,
    Adresse Varchar(30) NOT NULL,
    Parrain integer,
    primary key (Numero),
    foreign key (Parrain) references Adherents(Numero)
);

insert into Adherents values (1,'LEROIS','Noa','Paris', NULL);
insert into Adherents values (2,'JENKINS','Yanis','Vincennes', NULL);
insert into Adherents values (3,'TOUROUSSI','Andrea','Chelles',2);
insert into Adherents values (4,'LEBLOND','Nicolas','Paris',2);
insert into Adherents values (5,'PALIN','Juliette','Versailles',1);
insert into Adherents values (6,'LEBRETON','Erwan','Quimper',2);
insert into Adherents values (7,'OREAL','Gautier','Meaux', NULL);
