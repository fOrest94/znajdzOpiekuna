

INSERT INTO znajdz_opiekuna.uzytkownik(id, email, haslo, poziom_dostepu, typ_uzytkownika, imie, nazwisko, aktywny, plec, miasto, kod_pocztowy)
VALUES('1','administrator','$2a$04$KWeGmrnv.s7rn/zWFN4p/emjZDCdW5pjD6DwsIxaj.GBHnfb6LoF6','ADMINISTRATOR','simply','Kasia','Twardo',1,1,'Kraków',null);

INSERT INTO znajdz_opiekuna.uzytkownik(id, email, haslo, poziom_dostepu, typ_uzytkownika, imie, nazwisko, aktywny, plec, miasto, kod_pocztowy)
VALUES('2','user123','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER','simple','Kasia','Twardo', 1,1,'Jasło','38-200');

INSERT INTO znajdz_opiekuna.uzytkownik(id, email, haslo, poziom_dostepu, typ_uzytkownika, imie, nazwisko, aktywny, plec, miasto, kod_pocztowy)
VALUES('3','user124','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER','sister','Ela','Sitka', 1,1,'Kraków','38-200');

INSERT INTO znajdz_opiekuna.uzytkownik(id, email, haslo, poziom_dostepu, typ_uzytkownika, imie, nazwisko, aktywny, plec, miasto, kod_pocztowy)
VALUES('4','user125','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER','simple','Kasia','Ropa', 1,1,'Krosno','38-200');

INSERT INTO znajdz_opiekuna.uzytkownik(id, email, haslo, poziom_dostepu, typ_uzytkownika, imie, nazwisko, aktywny, plec, miasto, kod_pocztowy)
VALUES('5','user126','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER','sister','Klaudia','Ssi', 1,1,'Lubla','38-200');

INSERT INTO znajdz_opiekuna.uzytkownik(id, email, haslo, poziom_dostepu, typ_uzytkownika, imie, nazwisko, aktywny, plec, miasto, kod_pocztowy)
VALUES('6','user127','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER','simple','Ania','Rupe', 1,1,'Rzeszów','38-200');

INSERT INTO znajdz_opiekuna.uzytkownik(id, email, haslo, poziom_dostepu, typ_uzytkownika, imie, nazwisko, aktywny, plec, miasto, kod_pocztowy)
VALUES('7','user128','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER','sister','Ksenia','Sraka', 1,1,'Krosno','38-200');

INSERT INTO znajdz_opiekuna.uzytkownik(id, email, haslo, poziom_dostepu, typ_uzytkownika, imie, nazwisko, aktywny, plec, miasto, kod_pocztowy)
VALUES('8','user129','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER','simple','Daria','Guc', 1,1,'Gdańsk','38-200');

INSERT INTO znajdz_opiekuna.uzytkownik(id, email, haslo, poziom_dostepu, typ_uzytkownika, imie, nazwisko, aktywny, plec, miasto, kod_pocztowy)
VALUES('9','user120','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER','sister','Retka','Stretka', 1,1,'Warszawa','38-200');

INSERT INTO znajdz_opiekuna.opiekun(id, id_uzytkownika, data_urodzenia, opieka_niania, opieka_starsi, umiej_sprzat, umiej_gotowa, umiej_zakup, umiej_prac, inne_umiejetnosci,
cos_o_sobie, doswiadczenie_dzieci, doswiadczenie_starsi, lat_dosw_dzieci, lat_dosw_starsi, wymiar_pol_etatu, wymiar_pelny_etat, wymiar_dorywczo, miejsce_opieki, praca_z_domem,
wynagrodzenie, wyksztalcenie, jezyki_obce) values(1,3,'05-03-1994',1,1,1,0,1,0,'strzelanie do dzieci, gonienie szczurów','jestem sypmatyczny ekstrawertyk z dużym brzuchem',1,0,'5 lat','brak',0,0,0,1,1,'8','srednie','rosyjski');


# username : administrator, password administrator
# username : user123, password user123
