CREATE DATABASE OZKANTEKRAR
USE OZKANTEKRAR

CREATE TABLE MUSTERILER(
ID INT IDENTITY(1,1) PRIMARY KEY,
AD NVARCHAR(50), SOYAF NVARCHAR(50),
CINSIYET BIT
)



INSERT INTO MUSTERILER VALUES('AHMET','KARA',1)
INSERT INTO MUSTERILER VALUES('AHMET','KARA',1)
INSERT INTO MUSTERILER VALUES('SELIN','KARA',0)
INSERT INTO MUSTERILER VALUES('AYSE', 'KARA',0)
INSERT INTO MUSTERILER VALUES('FATMA','KARA',0)

CREATE PROC MUSTERI_SAY
@CINSIYET BIT,
@SAY INT OUTPUT
AS
BEGIN
	SELECT @SAY=COUNT(ID) FROM MUSTERILER 
	WHERE CINSIYET=@CINSIYET
END

DECLARE @X INT
EXEC MUSTERI_SAY 0,@X OUTPUT
PRINT @X



DECLARE @Y INT
EXEC MUSTERI_SAY 0,@Y OUTPUT
IF(@Y=0)
	PRINT 'MUSTERI YOK'
ELSE
	PRINT 'MUSTERI SAYISI: ' +CONVERT(NVARCHAR, @Y)


CREATE TABLE KULLANICILAR2(
KULADI NVARCHAR(20),
PAROLA NVARCHAR(20),
)

ALTER TABLE KULLANICILAR2 ADD DURUM BIT

INSERT INTO KULLANICILAR2 VALUES('ADMIN','123')
INSERT INTO KULLANICILAR2 VALUES('USER','124')

CREATE PROC LOGINS
@KULADI NVARCHAR(20),
@PAROLA NVARCHAR(20)
AS
BEGIN
	SELECT * FROM KULLANICILAR2
	WHERE KULADI = @KULADI AND PAROLA = @PAROLA
END

EXEC LOGINS 'ADMIN', '123'

SELECT * FROM KULLANICILAR2

CREATE PROC BAN
AS
BEGIN 
	UPDATE KULLANICILAR2 SET DURUM = 0
	WHERE DURUM IS NULL
END

SELECT * FROM KULLANICILAR2
EXEC BAN
SELECT * FROM KULLANICILAR2


