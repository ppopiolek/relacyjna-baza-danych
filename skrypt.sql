/*
Created: 17.11.2020
Modified: 26.11.2020
Model: Port_tranzytowy
Database: Oracle 12c Release 2
*/


-- Create sequences section -------------------------------------------------

CREATE SEQUENCE PortSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE MagazynSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE LadunekSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE ZlecenieSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE AdresSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE WlascicielSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE PracownikSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE SkladSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Msc_sklSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE WozekSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE MarkaSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE ModelSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE WynagSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE StanowiskoSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE KlientSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

-- Create tables section -------------------------------------------------

-- Table Porty

CREATE TABLE Porty(
  Nr_portu Integer NOT NULL,
  Nazwa Varchar2(30 ) NOT NULL,
  Email Varchar2(50 ) NOT NULL,
  Nr_telefonu Varchar2(20 ) NOT NULL,
  Nr_adresu Integer NOT NULL
)
/



-- Add keys for table Porty

ALTER TABLE Porty ADD CONSTRAINT PK_Port PRIMARY KEY (Nr_portu)
/

-- Table Magazyny

CREATE TABLE Magazyny(
  Nr_magazynu Integer NOT NULL,
  Pojemnosc Integer NOT NULL,
  Nr_telefonu Varchar2(20 ),
  Nr_portu Integer NOT NULL
)
/


-- Add keys for table Magazyny

ALTER TABLE Magazyny ADD CONSTRAINT PK_Magazyn PRIMARY KEY (Nr_magazynu)
/

-- Table Ladunki

CREATE TABLE Ladunki(
  Nr_ladunku Integer NOT NULL,
  Objetosc Integer NOT NULL,
  Masa Integer NOT NULL,
  Nr_zlecenia Integer NOT NULL
)
/



-- Add keys for table Ladunki

ALTER TABLE Ladunki ADD CONSTRAINT PK_Ladunek PRIMARY KEY (Nr_ladunku)
/

-- Table Klienci

CREATE TABLE Klienci(
  Nr_klienta Integer NOT NULL,
  Nazwa_firmy Varchar2(100 ) NOT NULL,
  Nr_telefonu Varchar2(20 ) NOT NULL,
  Email Varchar2(50 ) NOT NULL,
  Nr_konta Varchar2(50 ),
  Nr_portu Integer NOT NULL,
  Nr_adresu Integer NOT NULL
)
/


-- Add keys for table Klienci

ALTER TABLE Klienci ADD CONSTRAINT PK_Klient PRIMARY KEY (Nr_klienta)
/

ALTER TABLE Klienci ADD CONSTRAINT AK_Klient UNIQUE (Nazwa_firmy)
/

-- Table Pracownicy

CREATE TABLE Pracownicy(
  Nr_pracownika Integer NOT NULL,
  Imie Varchar2(30 ) NOT NULL,
  Nazwisko Varchar2(30 ) NOT NULL,
  Plec Char(1 ) NOT NULL
        CHECK (Plec IN ('K', 'M', 'I')),
  Nr_telefonu Varchar2(20 ) NOT NULL,
  Email Varchar2(50 ) NOT NULL,
  Data_urodzenia Date NOT NULL,
  Data_zatrudnienia Date NOT NULL,
  PESEL Char(11 ),
  Nr_konta Varchar2(50 ),
  Nr_portu Integer NOT NULL,
  Nr_adresu Integer NOT NULL,
  Nr_stanowiska Integer NOT NULL
)
/

-- Add keys for table Pracownicy

ALTER TABLE Pracownicy ADD CONSTRAINT PK_Pracownik PRIMARY KEY (Nr_pracownika)
/

-- Table Magazynierzy

CREATE TABLE Magazynierzy(
  Nr_pracownika Integer NOT NULL,
  Data_badania Date NOT NULL,
  Data_uprawnien Date NOT NULL
)
/

-- Add keys for table Magazynierzy

ALTER TABLE Magazynierzy ADD CONSTRAINT Unique_Identifier8 
PRIMARY KEY (Nr_pracownika)
/

-- Table Magazynierzy_Magazyny

CREATE TABLE Magazynierzy_Magazyny(
  Nr_magazynu Integer NOT NULL,
  Nr_pracownika Integer NOT NULL
)
/

-- Table Adresy

CREATE TABLE Adresy(
  Nr_adresu Integer NOT NULL,
  Miasto Varchar2(30 ) NOT NULL,
  Ulica Varchar2(30 ) NOT NULL,
  Nr_lokalu Varchar2(5 ) NOT NULL,
  Kod_pocztowy Char(6 ) NOT NULL,
  Kraj Varchar2(30 ) NOT NULL
)
/

-- Add keys for table Adresy

ALTER TABLE Adresy ADD CONSTRAINT PK_Adresy PRIMARY KEY (Nr_adresu)
/

-- Table and Columns comments section

COMMENT ON COLUMN Adresy.Nr_adresu IS 'Unikatowy numer adresu'
/
COMMENT ON COLUMN Adresy.Miasto IS 'Miasto'
/
COMMENT ON COLUMN Adresy.Ulica IS 'Ulica'
/
COMMENT ON COLUMN Adresy.Nr_lokalu IS 'Numer lokalu'
/
COMMENT ON COLUMN Adresy.Kod_pocztowy IS 'Kod pocztowy'
/
COMMENT ON COLUMN Adresy.Kraj IS 'Kraj'
/

-- Table Wlasciciele

CREATE TABLE Wlasciciele(
  Nr_wlasciciela Integer NOT NULL,
  Imie Varchar2(30 ) NOT NULL,
  Nazwisko Varchar2(30 ) NOT NULL,
  Nr_portu Integer NOT NULL
)
/

-- Add keys for table Wlasciciele

ALTER TABLE Wlasciciele ADD CONSTRAINT PK_Wlasciciele PRIMARY KEY (Nr_wlasciciela)
/

-- Table and Columns comments section

COMMENT ON COLUMN Wlasciciele.Nr_wlasciciela IS 'Unikatowy numer wlasciciela'
/
COMMENT ON COLUMN Wlasciciele.Imie IS 'Imie wlasciciela'
/
COMMENT ON COLUMN Wlasciciele.Nazwisko IS 'Nazwisko wlasciciela'
/

-- Table Stanowiska

CREATE TABLE Stanowiska(
  Nr_stanowiska Integer NOT NULL,
  Nazwa Varchar2(30 ) NOT NULL,
  Opis Varchar2(400 ) NOT NULL
)
/

-- Add keys for table Stanowiska

ALTER TABLE Stanowiska ADD CONSTRAINT PK_Stanowiska PRIMARY KEY (Nr_stanowiska)
/

ALTER TABLE Stanowiska ADD CONSTRAINT Nazwa UNIQUE (Nazwa)
/

-- Table and Columns comments section

COMMENT ON COLUMN Stanowiska.Nr_stanowiska IS 'Unikatowy numer stanowiska'
/
COMMENT ON COLUMN Stanowiska.Nazwa IS 'Nazwa stanowiska'
/
COMMENT ON COLUMN Stanowiska.Opis IS 'Opis stanowiska'
/

-- Table Wynagrodzenia

CREATE TABLE Wynagrodzenia(
  Nr_wynagrodzenia Integer NOT NULL,
  Data Date NOT NULL,
  Kwota_podstawowa Number(8,2) NOT NULL,
  Kwota_dodatkowa Number(7,2),
  Nr_pracownika Integer NOT NULL
)
/


-- Add keys for table Wynagrodzenia

ALTER TABLE Wynagrodzenia ADD CONSTRAINT PK_Wynagrodzenia 
PRIMARY KEY (Nr_wynagrodzenia)
/

-- Table and Columns comments section

COMMENT ON COLUMN Wynagrodzenia.Nr_wynagrodzenia IS 'Unikatowy numer wynagrodzenia'
/
COMMENT ON COLUMN Wynagrodzenia.Data IS 'Data wyplaty wynagrodzenia'
/
COMMENT ON COLUMN Wynagrodzenia.Kwota_podstawowa IS 'Kwota podstawowa wynagordzenia'
/
COMMENT ON COLUMN Wynagrodzenia.Kwota_dodatkowa IS 'Kwota dodatkowa'
/

-- Table Zlecenia

CREATE TABLE Zlecenia(
  Nr_zlecenia Integer NOT NULL,
  Cena Integer NOT NULL,
  Data_przyjecia_zlecenia Date NOT NULL,
  Status Varchar2(12 ) NOT NULL
        CHECK (Status IN ('Aktywne', 'Zrealizowane')),
  Data_dostawy Date NOT NULL,
  Data_odbioru Date NOT NULL,
  Opis Varchar2(1200 ),
  Nr_klienta Integer NOT NULL
)
/

-- Add keys for table Zlecenia

ALTER TABLE Zlecenia ADD CONSTRAINT PK_Zlecenie PRIMARY KEY (Nr_zlecenia)
/

-- Table and Columns comments section

COMMENT ON COLUMN Zlecenia.Opis IS 'Opis zlecenia'
/

-- Table Wozki_widlowe

CREATE TABLE Wozki_widlowe(
  Nr_wozka Integer NOT NULL,
  Nr_fabryczny Varchar2(30 ) NOT NULL,
  Rok_produkcji Integer NOT NULL,
  Udzwig Integer NOT NULL,
  Wysokosc_podnoszenia Integer NOT NULL,
  Nr_modelu Integer NOT NULL,
  Nr_portu Integer NOT NULL,
  Nr_magazynu Integer
)
/

-- Add keys for table Wozki_widlowe

ALTER TABLE Wozki_widlowe ADD CONSTRAINT PK_Wozki_widlowe PRIMARY KEY (Nr_wozka)
/

ALTER TABLE Wozki_widlowe ADD CONSTRAINT AK_Wozki_widlowe UNIQUE (Nr_fabryczny)
/

-- Table and Columns comments section

COMMENT ON COLUMN Wozki_widlowe.Nr_wozka IS 'Unikatowy numer wozka widlowego'
/
COMMENT ON COLUMN Wozki_widlowe.Nr_fabryczny IS 'Numer fabryczny wozka widlowego'
/
COMMENT ON COLUMN Wozki_widlowe.Udzwig IS 'Udzwig wozka widlowego w kilogramach'
/
COMMENT ON COLUMN Wozki_widlowe.Wysokosc_podnoszenia IS 
'Wysokosc podnoszenia wozka widlowego'
/

-- Table Marki

CREATE TABLE Marki(
  Nr_marki Integer NOT NULL,
  Nazwa_marki Varchar2(35 ) NOT NULL,
  Opis Varchar2(400 )
)
/

-- Add keys for table Marki

ALTER TABLE Marki ADD CONSTRAINT PK_Marki PRIMARY KEY (Nr_marki)
/

ALTER TABLE Marki ADD CONSTRAINT AK_Marki UNIQUE (Nazwa_marki)
/

-- Table and Columns comments section

COMMENT ON COLUMN Marki.Nr_marki IS 'Unikatowy numer marki wozka widlowego'
/
COMMENT ON COLUMN Marki.Opis IS 'Opis marki wozka widlowego'
/

-- Table Modele

CREATE TABLE Modele(
  Nr_modelu Integer NOT NULL,
  Nazwa_modelu Varchar2(50 ) NOT NULL,
  Opis Varchar2(400 ),
  Nr_marki Integer NOT NULL
)
/

-- Add keys for table Modele

ALTER TABLE Modele ADD CONSTRAINT PK_Modele PRIMARY KEY (Nr_modelu)
/

-- Table and Columns comments section

COMMENT ON COLUMN Modele.Nr_modelu IS 'Unikatowy numer modelu wozka widlowego'
/
COMMENT ON COLUMN Modele.Opis IS 'Opis modelu wozka widlowego'
/

-- Table Skladowania

CREATE TABLE Skladowania(
  Data_poczatku Date NOT NULL,
  Nr_ladunku Integer NOT NULL,
  Nr_miejsca Integer NOT NULL,
  Data_konca Date NOT NULL
)
/

-- Add keys for table Skladowania

ALTER TABLE Skladowania ADD CONSTRAINT PK_Skladowania PRIMARY KEY 
(Nr_ladunku,Nr_miejsca,Data_poczatku)
/

-- Table and Columns comments section

COMMENT ON COLUMN Skladowania.Data_poczatku IS 'Data poczatku skladowania ladunku.'
/
COMMENT ON COLUMN Skladowania.Data_konca IS 'Data konca skladowania ladunku.'
/

-- Table Miejsca_sklad

CREATE TABLE Miejsca_sklad(
  Nr_miejsca Integer NOT NULL,
  Nr_regalu Integer NOT NULL,
  Nr_polki Integer NOT NULL,
  Wysokosc Integer NOT NULL,
  Nr_magazynu Integer NOT NULL
)
/

-- Add keys for table Miejsca_sklad

ALTER TABLE Miejsca_sklad ADD CONSTRAINT PK_Miejsca_sklad PRIMARY KEY (Nr_miejsca)
/

-- Table and Columns comments section

COMMENT ON COLUMN Miejsca_sklad.Nr_miejsca IS 
'Unikatowy numer miejsca przechowywania ladunku.'
/
COMMENT ON COLUMN Miejsca_sklad.Nr_regalu IS 'Numer regalu.'
/
COMMENT ON COLUMN Miejsca_sklad.Nr_polki IS 'Numer polki.'
/
COMMENT ON COLUMN Miejsca_sklad.Wysokosc IS 
'Wysokosc nad ziemia miejsca skladowania (w metrach).'
/

-- Trigger for sequence PortSeq1 for column Nr_portu in table Porty ---------
CREATE OR REPLACE TRIGGER ts_Porty_PortSeq1 BEFORE INSERT
ON Porty FOR EACH ROW
BEGIN
  :new.Nr_portu := PortSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Porty_PortSeq1 AFTER UPDATE OF Nr_portu
ON Porty FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_portu in table
Porty as it uses sequence.');
END;
/

-- Trigger for sequence MagazynSeq1 for column Nr_magazynu in table Magazyny ---------
CREATE OR REPLACE TRIGGER ts_Magazyny_MagazynSeq1 BEFORE INSERT
ON Magazyny FOR EACH ROW
BEGIN
  :new.Nr_magazynu := MagazynSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Magazyny_MagazynSeq1 AFTER UPDATE OF Nr_magazynu
ON Magazyny FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_magazynu in table
Magazyny as it uses sequence.');
END;
/

-- Trigger for sequence LadunekSeq1 for column Nr_ladunku in table Ladunki ---------
CREATE OR REPLACE TRIGGER ts_Ladunki_LadunekSeq1 BEFORE INSERT
ON Ladunki FOR EACH ROW
BEGIN
  :new.Nr_ladunku := LadunekSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Ladunki_LadunekSeq1 AFTER UPDATE OF Nr_ladunku
ON Ladunki FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_ladunku in table
Ladunki as it uses sequence.');
END;
/

-- Trigger for sequence KlientSeq1 for column Nr_klienta in table Klienci ---------
CREATE OR REPLACE TRIGGER ts_Klienci_KlientSeq1 BEFORE INSERT
ON Klienci FOR EACH ROW
BEGIN
  :new.Nr_klienta := KlientSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Klienci_KlientSeq1 AFTER UPDATE OF Nr_klienta
ON Klienci FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_klienta in table
Klienci as it uses sequence.');
END;
/

-- Trigger for sequence PracownikSeq1 for column Nr_pracownika in table Pracownicy ---------
CREATE OR REPLACE TRIGGER ts_Pracownicy_PracownikSeq1 BEFORE INSERT
ON Pracownicy FOR EACH ROW
BEGIN
  :new.Nr_pracownika := PracownikSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Pracownicy_PracownikSeq1 AFTER UPDATE OF Nr_pracownika
ON Pracownicy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_pracownika in table
Pracownicy as it uses sequence.');
END;
/

-- Trigger for sequence AdresSeq1 for column Nr_adresu in table Adresy ---------
CREATE OR REPLACE TRIGGER ts_Adresy_AdresSeq1 BEFORE INSERT
ON Adresy FOR EACH ROW
BEGIN
  :new.Nr_adresu := AdresSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Adresy_AdresSeq1 AFTER UPDATE OF Nr_adresu
ON Adresy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_adresu in table
Adresy as it uses sequence.');
END;
/

-- Trigger for sequence WlascicielSeq1 for column Nr_wlasciciela in table Wlasciciele ---------
CREATE OR REPLACE TRIGGER ts_Wlasciciele_WlascicielSeq1 BEFORE INSERT
ON Wlasciciele FOR EACH ROW
BEGIN
  :new.Nr_wlasciciela := WlascicielSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Wlasciciele_WlascicielSeq1 AFTER UPDATE OF
Nr_wlasciciela
ON Wlasciciele FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_wlasciciela in table
Wlasciciele as it uses sequence.');
END;
/

-- Trigger for sequence StanowiskoSeq1 for column Nr_stanowiska in table Stanowiska ---------
CREATE OR REPLACE TRIGGER ts_Stanowiska_StanowiskoSeq1 BEFORE INSERT
ON Stanowiska FOR EACH ROW
BEGIN
  :new.Nr_stanowiska := StanowiskoSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Stanowiska_StanowiskoSeq1 AFTER UPDATE OF Nr_stanowiska
ON Stanowiska FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_stanowiska in table
Stanowiska as it uses sequence.');
END;
/

-- Trigger for sequence WynagSeq1 for column Nr_wynagrodzenia in table Wynagrodzenia ---------
CREATE OR REPLACE TRIGGER ts_Wynagrodzenia_WynagSeq1 BEFORE INSERT
ON Wynagrodzenia FOR EACH ROW
BEGIN
  :new.Nr_wynagrodzenia := WynagSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Wynagrodzenia_WynagSeq1 AFTER UPDATE OF
Nr_wynagrodzenia
ON Wynagrodzenia FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_wynagrodzenia in table
Wynagrodzenia as it uses sequence.');
END;
/

-- Trigger for sequence ZlecenieSeq1 for column Nr_zlecenia in table Zlecenia ---------
CREATE OR REPLACE TRIGGER ts_Zlecenia_ZlecenieSeq1 BEFORE INSERT
ON Zlecenia FOR EACH ROW
BEGIN
  :new.Nr_zlecenia := ZlecenieSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Zlecenia_ZlecenieSeq1 AFTER UPDATE OF Nr_zlecenia
ON Zlecenia FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_zlecenia in table
Zlecenia as it uses sequence.');
END;
/

-- Trigger for sequence WozekSeq1 for column Nr_wozka in table
Wozki_widlowe ---------
CREATE OR REPLACE TRIGGER ts_Wozki_widlowe_WozekSeq1 BEFORE INSERT
ON Wozki_widlowe FOR EACH ROW
BEGIN
  :new.Nr_wozka := WozekSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Wozki_widlowe_WozekSeq1 AFTER UPDATE OF Nr_wozka
ON Wozki_widlowe FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_wozka in table
Wozki_widlowe as it uses sequence.');
END;
/

-- Trigger for sequence MarkaSeq1 for column Nr_marki in table Marki ---------
CREATE OR REPLACE TRIGGER ts_Marki_MarkaSeq1 BEFORE INSERT
ON Marki FOR EACH ROW
BEGIN
  :new.Nr_marki := MarkaSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Marki_MarkaSeq1 AFTER UPDATE OF Nr_marki
ON Marki FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_marki in table
Marki as it uses sequence.');
END;
/

-- Trigger for sequence ModelSeq1 for column Nr_modelu in table Modele ---------
CREATE OR REPLACE TRIGGER ts_Modele_ModelSeq1 BEFORE INSERT
ON Modele FOR EACH ROW
BEGIN
  :new.Nr_modelu := ModelSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Modele_ModelSeq1 AFTER UPDATE OF Nr_modelu
ON Modele FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_modelu in table
Modele as it uses sequence.');
END;
/

-- Trigger for sequence Msc_sklSeq1 for column Nr_miejsca in table Miejsca_sklad ---------
CREATE OR REPLACE TRIGGER ts_Miejsca_sklad_Msc_sklSeq1 BEFORE INSERT
ON Miejsca_sklad FOR EACH ROW
BEGIN
  :new.Nr_miejsca := Msc_sklSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Miejsca_sklad_Msc_sklSeq1 AFTER UPDATE OF Nr_miejsca
ON Miejsca_sklad FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_miejsca in table
Miejsca_sklad as it uses sequence.');
END;
/


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE Magazyny ADD CONSTRAINT posiada_magazyn FOREIGN KEY (Nr_portu)
REFERENCES Porty (Nr_portu)
/



ALTER TABLE Klienci ADD CONSTRAINT ma_klienta FOREIGN KEY (Nr_portu)
REFERENCES Porty (Nr_portu)
/



ALTER TABLE Pracownicy ADD CONSTRAINT zatrudnia FOREIGN KEY (Nr_portu)
REFERENCES Porty (Nr_portu)
/



ALTER TABLE Klienci ADD CONSTRAINT adres_klienta FOREIGN KEY (Nr_adresu)
REFERENCES Adresy (Nr_adresu)
/



ALTER TABLE Porty ADD CONSTRAINT adres_portu FOREIGN KEY (Nr_adresu)
REFERENCES Adresy (Nr_adresu)
/



ALTER TABLE Pracownicy ADD CONSTRAINT adres_pracownika FOREIGN KEY (Nr_adresu)
REFERENCES Adresy (Nr_adresu)
/



ALTER TABLE Wlasciciele ADD CONSTRAINT port_ma_wlasciciela FOREIGN KEY (Nr_portu) 
REFERENCES Porty (Nr_portu)
/



ALTER TABLE Pracownicy ADD CONSTRAINT pracownik_ma_stanowisko FOREIGN KEY
(Nr_stanowiska) REFERENCES Stanowiska (Nr_stanowiska)
/



ALTER TABLE Wynagrodzenia ADD CONSTRAINT otrzymuje_wynagrodzenie FOREIGN KEY
(Nr_pracownika) REFERENCES Pracownicy (Nr_pracownika)
/



ALTER TABLE Zlecenia ADD CONSTRAINT ma_zlecenia FOREIGN KEY (Nr_klienta)
REFERENCES Klienci (Nr_klienta)
/



ALTER TABLE Ladunki ADD CONSTRAINT zawiera_ladunek FOREIGN KEY (Nr_zlecenia)
REFERENCES Zlecenia (Nr_zlecenia)
/



ALTER TABLE Modele ADD CONSTRAINT posiada_model FOREIGN KEY (Nr_marki)
REFERENCES Marki (Nr_marki)
/



ALTER TABLE Wozki_widlowe ADD CONSTRAINT wozek_ma_model FOREIGN KEY (Nr_modelu)
REFERENCES Modele (Nr_modelu)
/



ALTER TABLE Wozki_widlowe ADD CONSTRAINT posiada_wozek FOREIGN KEY (Nr_portu)
REFERENCES Porty (Nr_portu)
/



ALTER TABLE Wozki_widlowe ADD CONSTRAINT przynalezy FOREIGN KEY (Nr_magazynu)
REFERENCES Magazyny (Nr_magazynu)
/



ALTER TABLE Skladowania ADD CONSTRAINT jest_skladowany FOREIGN KEY (Nr_ladunku)
REFERENCES Ladunki (Nr_ladunku)
/



ALTER TABLE Miejsca_sklad ADD CONSTRAINT ma_miejsce_skladowania FOREIGN KEY
(Nr_magazynu) REFERENCES Magazyny (Nr_magazynu)
/



ALTER TABLE Skladowania ADD CONSTRAINT jest_na_miejscu FOREIGN KEY (Nr_miejsca) 
REFERENCES Miejsca_sklad (Nr_miejsca)
/

--create indexes 
CREATE INDEX IX_adres_portu ON Porty (Nr_adresu);
CREATE INDEX IX_zawiera_ladunek ON Ladunki (Nr_zlecenia);
CREATE INDEX IX_ma_miejsce_skladowania ON Miejsca_sklad (Nr_magazynu);
CREATE INDEX IX_zatrudnia ON Pracownicy (Nr_portu);
CREATE INDEX IX_pracownik_ma_stanowisko ON Pracownicy (Nr_stanowiska);
CREATE INDEX IX_ma_klienta ON Klienci (Nr_portu);
CREATE INDEX IX_adres_klienta ON Klienci (Nr_adresu);




