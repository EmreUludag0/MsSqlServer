CREATE DATABASE KOUDENEME
USE KOUDENEME

CREATE TABLE MUSTERILER(
ID INT IDENTITY(1,1) PRIMARY KEY,
ADSOYAD NVARCHAR(40)
)

CREATE TABLE URUNLER(
URUN INT IDENTITY(1,1) PRIMARY KEY,
URUNADI NVARCHAR(50)
)

CREATE TABLE STOKLAR(
URUNID INT,
ADET INT, 
TARIH DATETIME
)

CREATE TABLE SIPARISLER(
URUNID INT,
MUSTERI_ID INT,
ADET INT, 
TARIH DATETIME
)

CREATE TABLE STOKTALEP(
URUNID INT,
ADET INT,
TARIH DATETIME
)

INSERT INTO MUSTERILER VALUES('AHMET KARA')
INSERT INTO MUSTERILER VALUES('MEHMET KARA')

INSERT INTO URUNLER VALUES('A')
INSERT INTO URUNLER VALUES('B')

INSERT INTO STOKLAR VALUES(1,5,SYSDATETIME())
INSERT INTO STOKLAR VALUES(2,3,SYSDATETIME())

SELECT * FROM MUSTERILER
SELECT * FROM URUNLER
SELECT * FROM STOKLAR
SELECT * FROM SIPARISLER
SELECT * FROM STOKTALEP

INSERT INTO SIPARISLER VALUES(2,1,3,SYSDATETIME())

CREATE TRIGGER KONTROL_STOK ON SIPARISLER
INSTEAD OF INSERT 
AS
BEGIN 
	DECLARE @URUNID INT, @ADET INT, @STOK INT
	SELECT @URUNID=URUNID, @ADET=ADET FROM inserted
	SELECT @STOK = ADET FROM STOKLAR WHERE URUNID = @URUNID
	IF @ADET > @STOK
	BEGIN 
		INSERT INTO  STOKTALEP VALUES(@URUNID,@ADET,SYSDATETIME())
	END
	ELSE
	BEGIN 
		INSERT INTO SIPARISLER SELECT * FROM inserted 
	END
END





CREATE TRIGGER STOK_GUNCELLE ON SIPARISLER
FOR INSERT 
AS
BEGIN 
	DECLARE @URUNID INT, @ADET INT
	SELECT @URUNID=URUNID, @ADET=ADET FROM inserted
	UPDATE STOKLAR SET ADET = ADET-@ADET WHERE URUNID=@URUNID
END
