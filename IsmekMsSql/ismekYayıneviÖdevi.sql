create database db_Yayýnevi;

create table tbl_yazar(
	yazar_id int primary key identity,
	adSoyad nvarchar(50),
	tc char(11) unique not null,
	dogum_tarihi date check(dogum_tarihi < getdate()),
	telefon char(11) unique not null,
	adres nvarchar(max),
	ülke nvarchar(50)
)

create table tbl_kitap(
	kitap_id int primary key identity,
	ad nvarchar(50),
	sayfa_sayisi varchar(4),
	isbn varchar(13) unique not null,
	fiyat smallmoney not null,
	aciklama varchar(max),
	basim_yili char(4),
	baski_sayisi varchar(3) check(baski_sayisi>0),
	baski_adedi int check(baski_adedi>0),
	stok_durumu bit not null,
	yazar_id int foreign key references tbl_yazar(yazar_id)
	/*yazar_id int foreign key references tbl_yazar(yazar_id)*/
)

create table tbl_musteri(
	musteri_id int primary key identity,
	adSoyad nvarchar(50) not null,
	tc char(11) unique not null,
	adres nvarchar(max),
	telefon char(11),
	üyelik bit not null
)


create table kitapTOmusteri(
	id int primary key,
	kitap_id int foreign key references tbl_kitap(kitap_id),
	musteri_id int foreign key references tbl_musteri(musteri_id)
)
