DROP DATABASE IF EXISTS clubChv;

create database clubChv;

use clubChv;

create table Cheveaux (
    Identifiant INTEGER NOT NULL,
    Nom Varchar(30) NOT NULL,
    Prenom Varchar(30) NOT NULL,
    Père integer,
    Mère integer,
    primary key (Identifiant),
    foreign key (Père) references Cheveaux(Identifiant),
    foreign key (Mère) references Cheveaux(Identifiant)
);

insert into Cheveaux values (21,'Ourasi','Alezane', NULL, NULL);
insert into Cheveaux values (22,'Vizira','Bai', NULL, NULL);
insert into Cheveaux values (23,'Burmese','Noir', NULL,NULL);
insert into Cheveaux values (24,'Albe','Alezane', NULL,NULL);
insert into Cheveaux values (25,'Comanche','Alezane', NULL,NULL);
insert into Cheveaux values (30,'Marengo','Noir',23,NULL);
insert into Cheveaux values (31,'Hickstead','Bai', NULL, NULL);
insert into Cheveaux values (33,'Seabiscuit', 'Bai', 21, 22);
insert into Cheveaux values (35,'Jappeloup','Noir', 23, NULL);
insert into Cheveaux values (40,'Seabiscuit','Noir', 23, 31);
