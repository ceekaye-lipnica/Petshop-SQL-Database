create database db_petshop;
drop database db_petshop;
use db_petshop; 


create table ownerTable (
ownerID varchar(255),
First_Name varchar(255),
Last_Name varchar(255),
Contact_No varchar(255),
Address varchar(255),
constraint OID_PK primary key (ownerID)
);


alter table ownerTable
	alter column First_Name varchar(255) not null;
alter table ownerTable
	alter column Last_Name varchar(255) not null;

/* INSERTING 10 RECORDS */

	insert into ownerTable(ownerID,First_Name,Last_Name,Contact_No,Address)
values ('O01','Bernadette','Nunez','09778865435','Lopez, Quezon')
	insert into ownerTable(ownerID,First_Name,Last_Name,Contact_No,Address)
values ('O02','Ceekaye','Lipnica','09567432123','Calauag, Quezon')
	insert into ownerTable(ownerID,First_Name,Last_Name,Contact_No,Address)
values ('O03','Kenneth','Anonuevo','09786567432','Tayabas, Quezon')
	insert into ownerTable(ownerID,First_Name,Last_Name,Contact_No,Address)
values ('O04','Diego','Cantre','09546321234','Atimonan, Quezon')
	insert into ownerTable(ownerID,First_Name,Last_Name,Contact_No,Address)
values ('O05','Camille','Marca','09324123432','Gumaca, Quezon')
	insert into ownerTable(ownerID,First_Name,Last_Name,Contact_No,Address)
values ('O06','Denver','Celiz','09908976787','Candelaria, Quezon')
	insert into ownerTable(ownerID,First_Name,Last_Name,Contact_No,Address)
values ('O07','Miggy','Sales','09565434565','Quezon, Quezon')
	insert into ownerTable(ownerID,First_Name,Last_Name,Contact_No,Address)
values ('O08','Lowrence ','Borja','094578987676','Plaridel, Quezon')
	insert into ownerTable(ownerID,First_Name,Last_Name,Contact_No,Address)
values ('O09','Gia','Marqueses','09089767876','Sariaya, Quezon')
	insert into ownerTable(ownerID,First_Name,Last_Name,Contact_No,Address)
values ('O10','Trisha','Sayno','09098765678','Dapdap, Quezon')

select * from ownerTable;

create table pet(
petID varchar(255),
ownerID varchar(255),
Pet_Name varchar(255),
Pet_Type varchar(255),
Breed varchar(255),
Age varchar(255),
Gender varchar(255),
constraint PID_PK primary key (petID),
constraint OID_FK foreign key (ownerID) references ownerTable (ownerID)
);


alter table pet
	add check (Gender='Female' or Gender='Male')

alter table pet
	add constraint d_Breed default 'mix breed' for Breed;


/* INSERTING 10 RECORDS */

insert into pet(petID,ownerID,Pet_Name,Pet_Type,Breed,Age,Gender)
	values ('P01','O01','Snow','Cat','Persian','1 year old','Female')
insert into pet(petID,ownerID,Pet_Name,Pet_Type,Breed,Age,Gender)
	values ('P02','O02','Hank','Dog','Husky','3 months old','Male')
insert into pet(petID,ownerID,Pet_Name,Pet_Type,Breed,Age,Gender)
	values ('P03','O03','Nick','Rabbit','Dutch','6 months old','Male')
insert into pet(petID,ownerID,Pet_Name,Pet_Type,Breed,Age,Gender)
	values ('P04','O04','Jasmine','Parrot','Cockatoo','1 year old','Female')
insert into pet(petID,ownerID,Pet_Name,Pet_Type,Breed,Age,Gender)
	values ('P05','O05','Dexter','Hamster','Syrian','5 months old','Male')
insert into pet(petID,ownerID,Pet_Name,Pet_Type,Breed,Age,Gender)
	values ('P06','O06','Max','Dog','Beagle','1 year old','Male')
insert into pet(petID,ownerID,Pet_Name,Pet_Type,Breed,Age,Gender)
	values ('P07','O07','Micky','Dog','French Bulldog','7 months old','Male')
insert into pet(petID,ownerID,Pet_Name,Pet_Type,Breed,Age,Gender)
	values ('P08','O08','Peter','Cat','Balinese','6 months old','Male')
insert into pet(petID,ownerID,Pet_Name,Pet_Type,Breed,Age,Gender)
	values ('P09','O09','Heti','Cat','Bengal','2 years old','Female')
insert into pet(petID,ownerID,Pet_Name,Pet_Type,Breed,Age,Gender)
	values ('P10','O10','Jessie','Dog','Shih Tzu','9 months old','Female')

select * from pet;

create table Pet_Procedure(
procedure_No varchar(255),
Procedure_Description varchar(255),
constraint PNID_PK primary key (procedure_No)
);


alter table Pet_Procedure
add unique (Procedure_Description);

alter table Pet_Procedure
add Price decimal(18,2);

/* INERTING 10 RECORDS */

insert into Pet_Procedure(procedure_No,Procedure_Description, Price)
	values('PN01','Anti-rabies Shot', 1500.00)
insert into Pet_Procedure(procedure_No,Procedure_Description, Price)
	values('PN02','Deworming', 500.00)
insert into Pet_Procedure(procedure_No,Procedure_Description, Price)
	values('PN03','Vitamins', 1200.00)
insert into Pet_Procedure(procedure_No,Procedure_Description, Price)
	values('PN04','Nail Trimming', 300.00)
insert into Pet_Procedure(procedure_No,Procedure_Description, Price)
	values('PN05','Nail Painting', 85.00)
insert into Pet_Procedure(procedure_No,Procedure_Description, Price)
	values('PN06','Nail Clipping', 50.00)
insert into Pet_Procedure(procedure_No,Procedure_Description, Price)
	values('PN07','De-Shedding Treatment', 300.00)
insert into Pet_Procedure(procedure_No,Procedure_Description, Price)
	values('PN08','Flea and Tick Treatment', 700.00)
insert into Pet_Procedure(procedure_No,Procedure_Description, Price)
	values('PN09','Ear Cleaning', 280.00)
insert into Pet_Procedure(procedure_No,Procedure_Description, Price)
	values('PN10','Brushing Teeth', 60.00)


select * from Pet_Procedure;


create table pet_visit(
visit_No varchar(255),
petID varchar(255),
visit_Date datetime,
procedure_No varchar(255),
constraint PVID_PK primary key (visit_No),
constraint PID_FK foreign key (petID) references pet (petID),
constraint PNID_FK foreign key (procedure_No) references Pet_Procedure (procedure_No)
);

/* INSERTING 10 RECORDS */

insert into pet_visit(visit_No, petID,visit_Date,procedure_No)
	values ('V01','P01','03/24/2021','PN01')
insert into pet_visit(visit_No, petID,visit_Date,procedure_No)
	values ('V02','P02','02/11/2021','PN05')
insert into pet_visit(visit_No, petID,visit_Date,procedure_No)
	values ('V03','P03','05/28/2021','PN09')
insert into pet_visit(visit_No, petID,visit_Date,procedure_No)
	values ('V04','P04','09/30/2021','PN02')
insert into pet_visit(visit_No, petID,visit_Date,procedure_No)
	values ('V05','P05','11/16/2021','PN03')
insert into pet_visit(visit_No, petID,visit_Date,procedure_No)
	values ('V06','P06','03/24/2021','PN06')
insert into pet_visit(visit_No, petID,visit_Date,procedure_No)
	values ('V07','P07','02/11/2021','PN05')
insert into pet_visit(visit_No, petID,visit_Date,procedure_No)
	values ('V08','P08','05/28/2021','PN08')
insert into pet_visit(visit_No, petID,visit_Date,procedure_No)
	values ('V09','P09','05/28/2021','PN09')
insert into pet_visit(visit_No, petID,visit_Date,procedure_No)
	values ('V10','P10','11/16/2021','PN10')


select * from pet_visit;


/* INSERTING 10 DML COMMANDS TO EACH TABLE */

	-- OWNER TABLE --

	UPDATE ownerTable
		SET First_Name = 'Kylie'
		WHERE ownerID = 'O01';
	UPDATE ownerTable
		SET Last_Name = 'Santos'
		WHERE ownerID = 'O02';
	UPDATE ownerTable
		SET Last_Name = 'Mendez'
		WHERE ownerID = 'O03';
	UPDATE ownerTable
		SET Contact_No = '09112233445'
		WHERE ownerID = 'O04';
	UPDATE ownerTable
		SET Address = 'Lucena City'
		WHERE ownerID = 'O05';
	UPDATE ownerTable
		SET First_Name = 'Mark Thomas'
		WHERE ownerID = 'O06';
	UPDATE ownerTable
		SET Last_Name = 'Dela Cruz'
		WHERE ownerID = 'O07';
	UPDATE ownerTable
		SET Last_Name = 'Reyes'
		WHERE ownerID = 'O06';
	UPDATE ownerTable
		SET Contact_No = '09090909090'
		WHERE ownerID = 'O09';
	UPDATE ownerTable
		SET Address = 'Paete, Laguna'
		WHERE ownerID = 'O10';


	select ownerID as [Owner ID], 
	First_Name + ' ' + Last_Name as [Owner's Name],
	Contact_No as [Cellphone No.],
	Address as Address
	from ownerTable;

	
	-- PET TABLE --


	UPDATE pet
		SET Pet_Name = 'Collins'
		WHERE petID = 'P01';
	UPDATE pet
		SET Pet_Type = 'Hamster'
		WHERE petID = 'P08';
	UPDATE pet
		SET Breed = 'Chinese Hamster'
		WHERE petID = 'P08';
	UPDATE pet
		SET Breed = 'Poddle'
		WHERE petID = 'P06';
	UPDATE pet
		SET Age = '5 months old'
		WHERE petID = 'P09';
	UPDATE pet
		SET Gender = 'Female'
		WHERE petID = 'P07';
	UPDATE pet
		SET Pet_Name = 'Vanessa'
		WHERE petID = 'P04';
	UPDATE pet
		SET Breed = 'Chartreux'
		WHERE petID = 'P01';
	UPDATE pet
		SET Pet_Type = 'Rabbit'
		WHERE petID = 'P10';
	UPDATE pet
		SET Breed = 'Californian Rabbit'
		WHERE petID = 'P10';


	
	select petID as [Pet ID], 
	ownerID as [Owner ID],
	Pet_Name as [Pet Name],
	Pet_Type as [Pet Type],
	Breed as Breed,
	Age as Age,
	Gender as Gender
	from pet;


	-- PET PROCEDURE TABLE --

	UPDATE Pet_Procedure
		SET Procedure_Description = 'Body Trim'
		WHERE procedure_No = 'PN01';
	UPDATE Pet_Procedure
		SET Procedure_Description = 'Full Groom'
		WHERE procedure_No = 'PN08';
	UPDATE Pet_Procedure
		SET Procedure_Description = 'Eye Stain Removal'
		WHERE procedure_No = 'PN07';
	UPDATE Pet_Procedure
		SET Procedure_Description = 'Anal Gland Expression'
		WHERE procedure_No = 'PN05';
	UPDATE Pet_Procedure
		SET Procedure_Description = 'Coat Whitening'
		WHERE procedure_No = 'PN10';
	UPDATE Pet_Procedure
		SET Price = 980.00
		WHERE procedure_No = 'PN04';
	UPDATE Pet_Procedure
		SET Price = 760.00
		WHERE procedure_No = 'PN07';
	UPDATE Pet_Procedure
		SET Price = 350.00
		WHERE procedure_No = 'PN03';
	UPDATE Pet_Procedure
		SET Price = 410.00
		WHERE procedure_No = 'PN06';
	UPDATE Pet_Procedure
		SET Price = 270.00
		WHERE procedure_No = 'PN09';
	

	select procedure_No as [Procedure No.],
	Procedure_Description as [Procedure Description],
	Price as Price
	from Pet_Procedure;
	

	-- PET VISIT -- 
	
	UPDATE pet_visit
		SET visit_Date = '09/23/2022'
		WHERE visit_No = 'V01';
	UPDATE pet_visit
		SET visit_Date = '09/23/2022'
		WHERE visit_No = 'V02';
	UPDATE pet_visit
		SET visit_Date = '09/23/2022'
		WHERE visit_No = 'V03';
	UPDATE pet_visit
		SET visit_Date = '09/23/2022'
		WHERE visit_No = 'V06';
	UPDATE pet_visit
		SET visit_Date = '02/14/2021'
		WHERE visit_No = 'V03';
	UPDATE pet_visit
		SET visit_Date = '02/14/2021'
		WHERE visit_No = 'V04';
	UPDATE pet_visit
		SET visit_Date = '12/06/2022'
		WHERE visit_No = 'V07';
	UPDATE pet_visit
		SET procedure_No = 'PN01'
		WHERE visit_No = 'V02';
	UPDATE pet_visit
		SET procedure_No = 'PN09'
		WHERE visit_No = 'V05';
	UPDATE pet_visit
		SET procedure_No = 'PN04'
		WHERE visit_No = 'V08';
	UPDATE pet_visit
		SET procedure_No = 'PN08'
		WHERE visit_No = 'V09';
	UPDATE pet_visit
		SET procedure_No = 'PN10'
		WHERE visit_No = 'V10';


	select visit_No as [Visit No.],
	petID as [Pet ID],
	visit_Date as [Date of Visit],
	procedure_No as [Procedure No.]
	from pet_visit;

	-- 2. create a select for the ff query -- 

	-- a. Owner Name, Pet Name, Breed, Visit date -- 
	-- inner join--

	select First_Name + ' ' + Last_Name as [Owner's Name], Pet_Type as [Pet Type], Breed , Visit_Date as [Visit Date]
	from ownerTable inner join pet on ownerTable. ownerID = pet. ownerID inner join pet_visit on pet. petID = pet_visit . petID ;


	--  b. Pet Name, Pet type, Breed, Number of visit -- 
	-- count--

	select Pet_Name as [Pet Name], Pet_Type as [Pet Type], Breed, count(ownerID) as [Number of Visit]
	from pet left join pet_visit on pet_visit.petID = pet.petID
	group by  Pet_Name, Pet_Type, Breed,pet.petID

	--  c. Procedure number, Procedure name, Number of use (based on the visit table) --
	
	select Pet_Procedure.procedure_No as [Procedure Number], Pet_Procedure.Procedure_Description as [Procedure Description], count (pet_visit.procedure_No) as [Number of Use] 
	from Pet_Procedure right join pet_visit on pet_visit.procedure_No = Pet_Procedure.procedure_No
	group by Pet_Procedure.procedure_No, Procedure_Description, pet_visit.procedure_No

	--  d. Owner name (full name), address, petname,pet type, pet breed, visit date, procedure name --

	select First_Name + ' ' + Last_Name as [Owner's Name], Address, Pet_Type as [Pet Type], Pet_Name as [Pet Name], Breed , Visit_Date as [Visit Date], Procedure_Description as [Procedure Description]
	from ownerTable inner join pet on ownerTable. ownerID = pet. ownerID inner join pet_visit on pet. petID = pet_visit . petID
	inner join Pet_Procedure  on pet_visit. procedure_No = Pet_Procedure.procedure_No;

	--  e. Owner Name (full name), pet type, Number of Pets registered in the petshop

	select First_Name + ' ' + Last_Name as [Owner's Name], Pet_Type as [Pet Type], count (pet.petID) as [Number of Pets]
	from ownerTable inner join pet on ownerTable. ownerID = pet. ownerID
	group by First_Name + ' ' + Last_Name, Pet_Type, pet.petID
