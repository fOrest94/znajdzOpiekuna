SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
SET collation_connection = 'utf8_general_ci';

CREATE DATABASE IF NOT EXISTS `znajdz_opiekuna` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `znajdz_opiekuna`;


DROP TABLE IF EXISTS `opiekun`;
CREATE TABLE IF NOT EXISTS `opiekun` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_uzytkownika` bigint(20) NOT NULL,
  `miasto` varchar(25) null ,
  `kod_pocztowy` varchar(6) null,
  `opieka_niania` int(2) NULL,
  `opieka_starsi` int(2) NULL,
  `umiej_sprzat` int(2) NULL,
  `umiej_gotowa` int(2) NULL,
  `umiej_zakup` int(2) NULL,
  `umiej_prac` int(2) NULL,
  `inne_umiejetnosci` varchar(100) NULL,
  `cos_o_sobie` varchar(350) NOT NULL,
  `doswiadczenie_dzieci` int(2) NULL,
  `doswiadczenie_starsi` int(2) NULL,
  `lat_dosw_dzieci` varchar(30) NULL,
  `lat_dosw_starsi` varchar(30) NULL,
  `wymiar_pol_etatu`int(2) NULL,
  `wymiar_pelny_etat` int(2) NULL,
  `wymiar_dorywczo` int(2) NULL,
  `miejsce_opieki` int(5) NOT NULL,
  `praca_z_domem` int(2) NOT NULL,
  `wynagrodzenie` varchar(6) NOT NULL,
  `wyksztalcenie` varchar(120) NULL,
  `jezyki_obce` varchar(120) NULL,
  `telefon` VARCHAR(20) null,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `szukajacy_opieki`;
CREATE TABLE IF NOT EXISTS `szukajacy_opieki` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_uzytkownika` bigint(20) NOT NULL,
  `cos_o_sobie` varchar(150) NOT NULL,
  `opieka_niania` int(2) NULL,
  `opieka_starsi` int(2) NULL,
  `praca_z_domem` int(2) NULL,
  `telefon` VARCHAR(20) null,
  `wynagrodzenie` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `komentarze`;
CREATE TABLE IF NOT EXISTS `komentarze` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_aktualnosci` bigint(20),
  `id_komentowanego` bigint(20),
  `id_uzytkownika` bigint(20) NOT NULL,
  `imie_uzytkownika` varchar(30),
  `nazwisko_uzytkownika` varchar(30),
  `tresc_komentarza` varchar(250),
  `data_komentarza` DATETIME NOT NULL,
  `ocena_komentarza` DOUBLE null,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `wiadomosci`;
CREATE TABLE IF NOT EXISTS `wiadomosci` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_nadawcy` bigint(20) NOT NULL,
  `id_odbiorcy` bigint(20) NOT NULL,
  `tytul_wiadomosci` varchar(50),
  `tresc_wiadomosci` varchar(500),
  `data_utworzenia` DATETIME NOT NULL,
  `odebrana` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `uzytkownik`;
CREATE TABLE IF NOT EXISTS `uzytkownik` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `haslo` varchar(128) NOT NULL,
  `poziom_dostepu` varchar(128) NOT NULL,
  `typ_uzytkownika` int(2) NOT NULL,
  `data_urodzenia` varchar(20) NULL,
  `aktywny` int(2) NOT NULL,
  `miasto` varchar(25) null ,
  `imie` varchar(25) null ,
  `nazwisko` varchar(25) null,
  `plec` varchar(25) null,
  `kod_pocztowy` varchar(6) null,
  `tozsamosc` varchar(6) not NULL,
  `wynagrodzenie` varchar(6) NULL,
  `ocena` varchar(6) NULL ,
  `ocena_ilosc` int(6) NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `aktualnosci`;
CREATE TABLE IF NOT EXISTS `aktualnosci` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tytul_aktualnosci` varchar(50),
  `opis_aktualnosci` varchar(2000),
  `data_utworzenia` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



ALTER TABLE `opiekun` ADD FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownik` (`id`);
ALTER TABLE `szukajacy_opieki` ADD FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownik` (`id`);
ALTER TABLE `wiadomosci` ADD FOREIGN KEY (`id_nadawcy`) REFERENCES `uzytkownik` (`id`);
ALTER TABLE `wiadomosci` ADD FOREIGN KEY (`id_odbiorcy`) REFERENCES `uzytkownik` (`id`);
ALTER TABLE `komentarze` ADD FOREIGN KEY (`id_aktualnosci`) REFERENCES `aktualnosci` (`id`);
ALTER TABLE `komentarze` ADD FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownik` (`id`);

