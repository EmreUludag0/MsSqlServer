--proje (ad, maliyet, zaman)
--mühendis (ad_soyad, tc, telefon)
--bolum (ad, uzmanlýk)
--ssk(sicil_no, prim)

create database db_proje;

create table proje(
	proje_id int primary key identity,
	ad nvarchar(50),
	maliyet money,
	zaman date check(zaman>getdate())
)

create table muhendis(
	muhendis_id int primary key identity,
	adSoyad varchar(50),
	tc nchar(11) unique not null,
	telefon nchar(11) unique not null 
)

create table projeTOmuhendis(
	id int primary key identity,
	proje_id int foreign key references proje(proje_id),
	muhendis_id int foreign key references muhendis(muhendis_id)
)

create table bolum(
	bolum_id int primary key identity,
	ad nvarchar(50),
	uzmanlik nvarchar(50)
)

create table projeTObolum(
	id int primary key identity,
	proje_id int foreign key references proje(proje_id),
	bolum_id int foreign key references bolum(bolum_id)
)

create table muhendisTObolum(
	id int primary key identity,
	muhendis_id int foreign key references muhendis(muhendis_id),
	bolum_id int foreign key references bolum(bolum_id)
)


create table ssk(
	ssk_id int primary key identity,
	sicilNo nchar(11) unique,
	day tinyint,
	prim smallmoney,
	muhendis_id int unique foreign key references muhendis(muhendis_id)
)