SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `rentacar` ;
USE `rentacar` ;

-- -----------------------------------------------------
-- Table `rentacar`.`TipVozila`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentacar`.`TipVozila` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv_tipa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentacar`.`Vozilo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentacar`.`Vozilo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tip_vozila_id` INT NOT NULL,
  `proizvodjac` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `godina_proizvodnje` INT NULL,
  `registarska_oznaka` VARCHAR(15) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Vozilo_TipVozila1_idx` (`tip_vozila_id` ASC),
  CONSTRAINT `fk_Vozilo_TipVozila1`
    FOREIGN KEY (`tip_vozila_id`)
    REFERENCES `rentacar`.`TipVozila` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentacar`.`Klijent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentacar`.`Klijent` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `godina_rodjenja` INT NULL,
  `broj_vozacke_dozvole` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentacar`.`Iznajmljivanje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentacar`.`Iznajmljivanje` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `klijent_id` INT NOT NULL,
  `vozilo_id` INT NOT NULL,
  `datum_iznajmljivanja` DATETIME NULL,
  `broj_predjenih_km` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Iznajmljivanje_Klijent1_idx` (`klijent_id` ASC),
  INDEX `fk_Iznajmljivanje_Vozilo1_idx` (`vozilo_id` ASC),
  CONSTRAINT `fk_Iznajmljivanje_Klijent1`
    FOREIGN KEY (`klijent_id`)
    REFERENCES `rentacar`.`Klijent` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Iznajmljivanje_Vozilo1`
    FOREIGN KEY (`vozilo_id`)
    REFERENCES `rentacar`.`Vozilo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `rentacar`.`TipVozila`
-- -----------------------------------------------------
START TRANSACTION;
USE `rentacar`;
INSERT INTO `rentacar`.`TipVozila` (`naziv_tipa`) VALUES ('Mini-automobil');
INSERT INTO `rentacar`.`TipVozila` (`naziv_tipa`) VALUES ('Mali porodicni automobil');
INSERT INTO `rentacar`.`TipVozila` (`naziv_tipa`) VALUES ('Veliki porodicni automobil');
INSERT INTO `rentacar`.`TipVozila` (`naziv_tipa`) VALUES ('Luksuzni automobil');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rentacar`.`Vozilo`
-- -----------------------------------------------------
START TRANSACTION;
USE `rentacar`;
INSERT INTO `rentacar`.`Vozilo` (`tip_vozila_id`, `proizvodjac`, `model`, `godina_proizvodnje`, `registarska_oznaka`) VALUES (1, 'Ford', 'Fiesta', 1999, 'NS 123-DF');
INSERT INTO `rentacar`.`Vozilo` (`tip_vozila_id`, `proizvodjac`, `model`, `godina_proizvodnje`, `registarska_oznaka`) VALUES (2, 'Ford', 'Focus', 2007, 'NS 452-LS');
INSERT INTO `rentacar`.`Vozilo` (`tip_vozila_id`, `proizvodjac`, `model`, `godina_proizvodnje`, `registarska_oznaka`) VALUES (2, 'Mazda', 'Mazda3', 2010, 'NS 043-SK');
INSERT INTO `rentacar`.`Vozilo` (`tip_vozila_id`, `proizvodjac`, `model`, `godina_proizvodnje`, `registarska_oznaka`) VALUES (2, 'Renault', 'Megane', 2001, 'NS 472-LA');
INSERT INTO `rentacar`.`Vozilo` (`tip_vozila_id`, `proizvodjac`, `model`, `godina_proizvodnje`, `registarska_oznaka`) VALUES (3, 'Ford', 'Mondeo', 2015, 'NS 936-RB');
INSERT INTO `rentacar`.`Vozilo` (`tip_vozila_id`, `proizvodjac`, `model`, `godina_proizvodnje`, `registarska_oznaka`) VALUES (3, 'Ford', 'Mondeo', 2016, 'NS 338-FC');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rentacar`.`Klijent`
-- -----------------------------------------------------
START TRANSACTION;
USE `rentacar`;
INSERT INTO `rentacar`.`Klijent` (`ime`, `prezime`, `godina_rodjenja`, `broj_vozacke_dozvole`) VALUES ('Petar', 'Petrovic', 1987, '000056789');
INSERT INTO `rentacar`.`Klijent` (`ime`, `prezime`, `godina_rodjenja`, `broj_vozacke_dozvole`) VALUES ('Marko', 'Markovic', 1979, '000061586');
INSERT INTO `rentacar`.`Klijent` (`ime`, `prezime`, `godina_rodjenja`, `broj_vozacke_dozvole`) VALUES ('Ivana', 'Ivanovic', 1992, '000094886');
INSERT INTO `rentacar`.`Klijent` (`ime`, `prezime`, `godina_rodjenja`, `broj_vozacke_dozvole`) VALUES ('Aleksandar', 'Aleksic', 1984, '000148646');
INSERT INTO `rentacar`.`Klijent` (`ime`, `prezime`, `godina_rodjenja`, `broj_vozacke_dozvole`) VALUES ('Branko', 'Brankovic', 1996, '000116296');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rentacar`.`Iznajmljivanje`
-- -----------------------------------------------------
START TRANSACTION;
USE `rentacar`;
INSERT INTO `rentacar`.`Iznajmljivanje` (`klijent_id`, `vozilo_id`, `datum_iznajmljivanja`, `broj_predjenih_km`) VALUES (1, 5, '2018-06-25', 15);
INSERT INTO `rentacar`.`Iznajmljivanje` (`klijent_id`, `vozilo_id`, `datum_iznajmljivanja`, `broj_predjenih_km`) VALUES (1, 6, '2018-07-12', 37);
INSERT INTO `rentacar`.`Iznajmljivanje` (`klijent_id`, `vozilo_id`, `datum_iznajmljivanja`, `broj_predjenih_km`) VALUES (5, 5, '2018-06-20', 23);
INSERT INTO `rentacar`.`Iznajmljivanje` (`klijent_id`, `vozilo_id`, `datum_iznajmljivanja`, `broj_predjenih_km`) VALUES (3, 1, '2018-12-12', 123);
INSERT INTO `rentacar`.`Iznajmljivanje` (`klijent_id`, `vozilo_id`, `datum_iznajmljivanja`, `broj_predjenih_km`) VALUES (3, 1, '2018-12-25', 33);
INSERT INTO `rentacar`.`Iznajmljivanje` (`klijent_id`, `vozilo_id`, `datum_iznajmljivanja`, `broj_predjenih_km`) VALUES (1, 3, '2018-10-19', 41);
INSERT INTO `rentacar`.`Iznajmljivanje` (`klijent_id`, `vozilo_id`, `datum_iznajmljivanja`, `broj_predjenih_km`) VALUES (4, 4, '2018-10-10', 21);
INSERT INTO `rentacar`.`Iznajmljivanje` (`klijent_id`, `vozilo_id`, `datum_iznajmljivanja`, `broj_predjenih_km`) VALUES (5, 2, '2018-09-25', 44);
INSERT INTO `rentacar`.`Iznajmljivanje` (`klijent_id`, `vozilo_id`, `datum_iznajmljivanja`, `broj_predjenih_km`) VALUES (4, 2, '2018-05-16', 68);
INSERT INTO `rentacar`.`Iznajmljivanje` (`klijent_id`, `vozilo_id`, `datum_iznajmljivanja`, `broj_predjenih_km`) VALUES (3, 1, '2018-06-06', 52);

COMMIT;

select * from TipVozila;

select vozilo.proizvodjac, vozilo.model from vozilo;

-- zadatak 1.a Prikazati sva vozila koja su proizvedena 2010. godine ili kasnije.
select vozilo.proizvodjac, vozilo.model 
from vozilo
where godina_proizvodnje > 2009;

-- zadatak 1.b . Prikazati sva vozila sa nazivom tipa vozila
select vozilo.proizvodjac, vozilo.model, tipvozila.naziv_tipa
from vozilo left join tipvozila on vozilo.tip_vozila_id = tipvozila.id;

-- zadatak 1.c Prikazati sva iznajmljivanja vozila zajedno sa registarskom oznakom i tipom vozila i
-- imenom i prezimenom osobe koja je vozilo iznajmila.

select vozilo.proizvodjac, vozilo.model, vozilo.registarska_oznaka, tipvozila.naziv_tipa, klijent.ime, klijent.prezime
from iznajmljivanje left join klijent on iznajmljivanje.klijent_id = klijent.id
left join vozilo on iznajmljivanje.vozilo_id = vozilo.id
left join tipvozila on vozilo.tip_vozila_id = tipvozila.id;

-- zadatak 1.d Prikazati sva vozila sa podatkom o ukupnom broju pređenih kilometara za svako vozilo.

select vozilo.proizvodjac, vozilo.model, vozilo.registarska_oznaka, iznajmljivanje.broj_predjenih_km
from vozilo left join iznajmljivanje on vozilo.id = iznajmljivanje.vozilo_id
group by vozilo.registarska_oznaka;

-- zadatak 1.e Prikazati sva iznajmljivanja kod kojih je broj pređenih kilometara manji od 30 ili je
-- iznajmljeno vozilo bilo mini automobil.

select vozilo.proizvodjac, vozilo.model, iznajmljivanje.broj_predjenih_km, tipvozila.naziv_tipa
from iznajmljivanje left join vozilo on iznajmljivanje.vozilo_id = vozilo.id
left join tipvozila on vozilo.tip_vozila_id = tipvozila.id
where
iznajmljivanje.broj_predjenih_km < 30
or
tipvozila.naziv_tipa = 'Mini-automobil';

-- zadatak 1.f Prikazati sve klijente čiji broj vozačke dozvole počinje sa četiri nule, sortirane opadajuće
-- po godini rođenja.
select klijent.ime, klijent.prezime, klijent.broj_vozacke_dozvole, klijent.godina_rodjenja
from klijent
where 
klijent.broj_vozacke_dozvole like '0000%'
order by klijent.godina_rodjenja desc;


