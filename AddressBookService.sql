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