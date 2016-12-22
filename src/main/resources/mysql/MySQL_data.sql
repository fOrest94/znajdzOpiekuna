INSERT INTO znajdz_opiekuna.uzytkownik(id, email, haslo, poziom_dostepu, typ_uzytkownika, imie, nazwisko, aktywny, plec, miasto, wynagrodzenie, kod_pocztowy, data_urodzenia)
VALUES('1','administrator','$2a$04$KWeGmrnv.s7rn/zWFN4p/emjZDCdW5pjD6DwsIxaj.GBHnfb6LoF6','ADMINISTRATOR',0,'Kasia','Twardo',1,'mężczyzna','Kraków','8', '35-200','05-04-1994');

INSERT INTO znajdz_opiekuna.uzytkownik(id, email, haslo, poziom_dostepu, typ_uzytkownika, imie, nazwisko, aktywny, plec, miasto, wynagrodzenie, kod_pocztowy, data_urodzenia)
VALUES('2','user123','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER',1,'Kasia','Twardo', 1,'kobieta','Jasło','9', '38-200','05-04-1994');

INSERT INTO znajdz_opiekuna.uzytkownik(id, email, haslo, poziom_dostepu, typ_uzytkownika, imie, nazwisko, aktywny, plec, miasto, wynagrodzenie, kod_pocztowy, data_urodzenia)
VALUES('3','user124','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER',2,'Ela','Sitka', 1,'kobieta','Kraków','8', '38-200','05-04-1992');

INSERT INTO znajdz_opiekuna.uzytkownik(id, email, haslo, poziom_dostepu, typ_uzytkownika, imie, nazwisko, aktywny, plec, miasto, wynagrodzenie, kod_pocztowy, data_urodzenia)
VALUES('4','user125','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER',1,'Kasia','Ropa', 1,'kobieta','Krosno','5', '38-200','05-04-1994');

INSERT INTO znajdz_opiekuna.uzytkownik(id, email, haslo, poziom_dostepu, typ_uzytkownika, imie, nazwisko, aktywny, plec, miasto, wynagrodzenie, kod_pocztowy, data_urodzenia)
VALUES('5','user126','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER',2,'Klaudia','Ssi', 1,'kobieta','Lubla','14', '38-200','05-04-1994');

INSERT INTO znajdz_opiekuna.uzytkownik(id, email, haslo, poziom_dostepu, typ_uzytkownika, imie, nazwisko, aktywny, plec, miasto, wynagrodzenie, kod_pocztowy, data_urodzenia)
VALUES('6','user127','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER',1,'Ania','Rupe', 1,'kobieta','Rzeszów','12', '38-200','05-04-1999');

INSERT INTO znajdz_opiekuna.uzytkownik(id, email, haslo, poziom_dostepu, typ_uzytkownika, imie, nazwisko, aktywny, plec, miasto, wynagrodzenie, kod_pocztowy, data_urodzenia)
VALUES('7','user128','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER',2,'Ksenia','Sraka', 1,'kobieta','Krosno','4', '38-200','05-04-1997');

INSERT INTO znajdz_opiekuna.uzytkownik(id, email, haslo, poziom_dostepu, typ_uzytkownika, imie, nazwisko, aktywny, plec, miasto, wynagrodzenie, kod_pocztowy, data_urodzenia)
VALUES('8','user129','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER',1,'Daria','Guc', 1,'kobieta','Gdańsk','31', '38-200','05-04-1994');

INSERT INTO znajdz_opiekuna.uzytkownik(id, email, haslo, poziom_dostepu, typ_uzytkownika, imie, nazwisko, aktywny, plec, miasto, wynagrodzenie, kod_pocztowy, data_urodzenia)
VALUES('9','user120','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER',2,'Retka','Stretka', 1,'kobieta','Warszawa','4', '38-200','05-04-1994');


INSERT INTO znajdz_opiekuna.szukajacy_opieki(id, id_uzytkownika, opieka_niania, opieka_starsi, praca_z_domem, cos_o_sobie, wynagrodzenie)
values(1,2,1,0,1,'jestem sypmatyczny ekstrawertyk z dużym brzuchem','8');

INSERT INTO znajdz_opiekuna.szukajacy_opieki(id, id_uzytkownika, opieka_niania, opieka_starsi, praca_z_domem, cos_o_sobie, wynagrodzenie)
values(2,6,1,0,1,'parówczak jakich mało chce oddac dzieci','11');

INSERT INTO znajdz_opiekuna.szukajacy_opieki(id, id_uzytkownika, opieka_niania, opieka_starsi, praca_z_domem, cos_o_sobie, wynagrodzenie)
values(3,4,0,1,1,'szukam frajerów pracujących ze starszymi za grosze','6');


INSERT INTO znajdz_opiekuna.opiekun(id, id_uzytkownika, data_urodzenia, opieka_niania, opieka_starsi, umiej_sprzat, umiej_gotowa, umiej_zakup, umiej_prac, inne_umiejetnosci,
cos_o_sobie, doswiadczenie_dzieci, doswiadczenie_starsi, lat_dosw_dzieci, lat_dosw_starsi, wymiar_pol_etatu, wymiar_pelny_etat, wymiar_dorywczo, miejsce_opieki, praca_z_domem,
wynagrodzenie, wyksztalcenie, jezyki_obce) values(1,3,'05-03-1994',1,1,1,0,1,0,'strzelanie do dzieci, gonienie szczurów','jestem sypmatyczny ekstrawertyk z dużym brzuchem',1,0,'5 lat','brak',0,0,0,1,1,'8','srednie','rosyjski');


# username : administrator, password administrator
# username : user123, password user123
