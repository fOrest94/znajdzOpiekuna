SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


CREATE DATABASE IF NOT EXISTS `znajdz_opiekuna` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `znajdz_opiekuna`;


DROP TABLE IF EXISTS `opiekun`;
CREATE TABLE IF NOT EXISTS `opiekun` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_uzytkownika` bigint(20) NOT NULL,
  `data_urodzenia` varchar(20) NOT NULL,
  `opieka_niania` int(2) NOT NULL,
  `opieka_starsi` int(2) NOT NULL,
  `umiej_sprzat` int(2) NOT NULL,
  `umiej_gotowa` int(2) NOT NULL,
  `umiej_zakup` int(2) NOT NULL,
  `umiej_prac` int(2) NOT NULL,
  `inne_umiejetnosci` varchar(100) NOT NULL,
  `cos_o_sobie` varchar(150) NOT NULL,
  `doswiadczenie_dzieci` int(2) NOT NULL,
  `doswiadczenie_starsi` int(2) NOT NULL,
  `lat_dosw_dzieci` varchar(30) NOT NULL,
  `lat_dosw_starsi` varchar(30) NOT NULL,
  `wymiar_pol_etatu` varchar(30) NOT NULL,
  `wymiar_pelny_etat` int(2) NOT NULL,
  `wymiar_dorywczo` int(2) NOT NULL,
  `miejsce_opieki` int(5) NOT NULL,
  `praca_z_domem` int(2) NOT NULL,
  `wynagrodzenie` varchar(120) NOT NULL,
  `wyksztalcenie` varchar(120) NOT NULL,
  `jezyki_obce` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `uzytkownik`;
CREATE TABLE IF NOT EXISTS `uzytkownik` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `haslo` varchar(128) NOT NULL,
  `poziom_dostepu` varchar(128) NOT NULL,
  `typ_uzytkownika` varchar(8) NOT NULL,
  `imie` varchar(25) null ,
  `nazwisko` varchar(25) null,
  `plec` int(2) null,
  `kod_pocztowy` varchar(8) null,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `opiekun` ADD FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownik` (`id`);