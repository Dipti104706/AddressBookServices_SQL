----------UC1--Create Addressbook Database------------ 
create database AddressBookService;
use AddressBookService;


-------------UC2-------------
------Create table------------------

create table AddressBookTable
(
FirstName varchar(100) not null,
LastName varchar(50),
Address varchar(200),
City varchar(150),
StateName varchar(100),
ZipCode int,
Phonenum bigint,
EmailId varchar(100)
);
select * from AddressBookTable;
----------UC3----->Insert into tables using fields--------

Insert into AddressBookTable values('Sarika','Boxi','Jhirpani','Rourkela','Odisha',769042,458721564,'sarikabx12@gmail.com'),
('Sujata','Patra','Jhirpani','Rourkela','Odisha',769042,3587215654,'sujatax14@gmail.com'),
('Debasmita','Sutar','Jagda','Rourkela','Odisha',769042,258721564,'deba12@gmail.com'),
('Suchitra','Mallick','Kalpana','Bhubaneswar','Odisha',751042,458721564,'suchim12@gmail.com');
select * from AddressBookTable;


--------------------UC4----------------------------------------
------edit existing contact person using person name----------
update AddressBookTable set Phonenum=7845712874 where FirstName='Sujata';
update AddressBookTable set LastName='Malick' where FirstName='Suchitra';
update AddressBookTable set EmailId='smita123@gmail.com' where LastName='Sutar';
update AddressBookTable set ZipCode='751185' where FirstName='Suchitra';
select * from AddressBookTable;

---------------------UC5---------------
------Delete a contact using perosn name-----
delete from AddressBookTable where FirstName='Sujata';
select * from AddressBookTable;

--------------------------UC6-----------------
---------------Retrieve data belongs to state or city---------
Select FirstName from AddressBookTable where City='Bhubaneswar' or StateName='Odisha';

------------------UC7--------------------------
------Size or Count of addressbook using state and city--------
Select Count(City) as Size,City,StateName from AddressBookTable group by StateName,City;

--------------------UC8--------------
-------Sort the name alphabetically using city name--------
select FirstName from AddressBookTable where City='Rourkela' order by FirstName;

---------------------UC9-------------------
-------Add the new columns and adding the address book name and type-----------
alter table AddressBookTable add 
AddressBookName varchar(50),
Type varchar(50);
select * from AddressBookTable;
-----------Update the table----------
update AddressBookTable set AddressBookName='BestFriend',Type='Friend' where FirstName='Sarika';
update AddressBookTable set AddressBookName='Sister',Type='Family' where FirstName='Debasmita';
update AddressBookTable set AddressBookName='Manager',Type='Profession' where FirstName='Suchitra';

---------------------------UC10------------------------
----------------Count person by type-----
Select count(Type)as Count,Type  from AddressBookTable group by Type;

----------------------UC11---------------
---------------- Insert same contact as family and friend-----
insert into AddressBookTable values('Debasmita','Sutar','Jagda','Rourkela','Odisha',769042,258721564,'deba12@gmail.com','closefriend','Friend');
select * from AddressBookTable;

-------Using ER Diagram----------Avoid duplicate-----
--------------Create Address_Book------------------
create table Address_Book(
AddressBookID int identity(1,1) primary key,
AddressBookName varchar(100)
)
---Insert the values in Address_Book
Insert into Address_Book values ('Diptimayee'),('Puja'),('Swornalata');
---Retrieve the data
select * from Address_Book;

--Create Contact_Person Table-------
create table Contact_Person(
Book_ID int,
ContactID int identity(1,1) primary key,
FirstName varchar(100),
LastName varchar(100),
Address varchar(250),
City varchar(100),
State varchar(100),
Pin BigInt,
PhoneNumber BigInt,
EmailId varchar(200),
foreign key (Book_ID) references Address_Book(AddressBookID));

select * from Contact_Person;

--Inserting contact details------- 
Insert into Contact_Person values('1','Sarika','Boxi','Jhirpani','Rourkela','Odisha',769042,458721564,'sarikabx12@gmail.com'),
('3','Sujata','Patra','Jhirpani','Rourkela','Odisha',769042,3587215654,'sujatax14@gmail.com'),
('1','Debasmita','Sutar','Jagda','Rourkela','Odisha',769042,258721564,'deba12@gmail.com'),
('2','Suchitra','Mallick','Kalpana','Bhubaneswar','Odisha',751042,458721564,'suchim12@gmail.com');

--Retrieve the data
select * from Contact_Person;

---Create Relation_type table------
create table Relation_type
(TypeID int identity(1,1) primary key,
 TypeName varchar(100)
 );
---Insert the values in contat_type
Insert into Relation_type values ('Family'),('Friends'),('Profession');
--Retrieve the data
Select * from Relation_type;

---Create relation type table
create Table Contact_Type(
ContactType_ID int,
Contact_ID int,
foreign key (ContactType_ID) references Relation_type(TypeID),
foreign key (Contact_ID) references Contact_Person(ContactID)
)
---Insert the values in relation_type
insert into Contact_Type values (1,3),(2,3),(3,1),(1,2),(2,4);
--Retrieve the data
Select * from Contact_Type;

----------------UC13---------------
-------------Redo UC6-10 with new tables----------
----UC6------------------
-------Retrieve Person Belonging to  City or State------
select Address_Book.AddressBookName,FirstName,LastName,Address,City,State,Pin,PhoneNumber,EmailId,TypeName
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=Contact_Person.Book_ID where City='Bhubaneswar' 
INNER JOIN Contact_Type on Contact_Type.Contact_ID=Contact_Person.ContactID
INNER JOIN Relation_type on Contact_Type.ContactType_ID=Relation_type.TypeID

----UC7--->Size of state and city
select Count(*)As CountOfStateAndCity ,State,City
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=AddressBook_ID Group by State,City

-----UC8--->Retrieve the person data entries sorted alphabetically
select AddressBookName,FirstName,LastName,Address,City,StateName,ZipCode,PhoneNum,EmailId,ContactTypeName
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=AddressBook_ID 
INNER JOIN Relation_Type on Relation_Type.Contact_Id=Contact_Person.ContactID
INNER JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID
order by(FirstName)
---	UC9--->Get Number Of contact persons by type
select Count(*) as NumberOfContacts,Contact_Type.ContactTypeName
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=Contact_Person.AddressBook_ID
INNER JOIN Relation_Type on Relation_Type.Contact_ID=Contact_Person.ContactID
INNER JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID
Group by ContactTypeName