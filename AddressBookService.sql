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