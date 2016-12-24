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
  `data_urodzenia` varchar(30) NULL,
  `opieka_niania` int(2) NULL,
  `opieka_starsi` int(2) NULL,
  `umiej_sprzat` int(2) NULL,
  `umiej_gotowa` int(2) NULL,
  `umiej_zakup` int(2) NULL,
  `umiej_prac` int(2) NULL,
  `inne_umiejetnosci` varchar(100) NULL,
  `cos_o_sobie` varchar(150) NOT NULL,
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
  `wynagrodzenie` varchar(5) NOT NULL,
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
  `wynagrodzenie` varchar(6) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `aktualnosci`;
CREATE TABLE IF NOT EXISTS `aktualnosci` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tytul_wiadomosci` varchar(50),
  `opis_wiadomosci` varchar(2000),
  `data_utworzenia` DATE NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `komentarze`;
CREATE TABLE IF NOT EXISTS `komentarze` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_wiadomosci` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_uzytkownika` bigint(20) NOT NULL AUTO_INCREMENT,
  `tresc_komentarza` varchar(250),
  `data_komentarza` DATE NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


ALTER TABLE `opiekun` ADD FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownik` (`id`);

ALTER TABLE `szukajacy_opieki` ADD FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownik` (`id`);