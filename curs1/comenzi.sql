CREATE DATABASE demo;
USE demo; --selecteaza cu ce baza de date lucram

CREATE TABLE `demo`.`studenti` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT , 
  `nume` VARCHAR(100) NOT NULL , 
  `prenume` VARCHAR(100) NOT NULL ,
   `telefon` CHAR(10) NOT NULL , 
   `email` VARCHAR(200) NOT NULL , 
   `data_adaugare` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , 
   PRIMARY KEY (`id`))
    ENGINE = InnoDB 
    CHARSET=utf8 COLLATE utf8_general_ci;

    ALTER TABLE `studenti` CHANGE `email` `email` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

    ALTER TABLE `demo`.`studenti` ADD UNIQUE `email_unic` (`email`);

    INSERT INTO `studenti` (`id`, `nume`, `prenume`, `telefon`, `email`, `data_adaugare`) VALUES (NULL, 'Popescu', 'Dan', '0756656788', 'popescu@dan.com', current_timestamp());

    UPDATE `studenti` SET `email` = 'popescu@dan.com.ro' WHERE `studenti`.`id` = 2;

UPDATE `studenti` SET `prenume` = 'Vasi' WHERE `studenti`.`id` = 1;

UPDATE `studenti` SET `prenume` = 'Dan Ion' WHERE `studenti`.`id` = 2;

SELECT * FROM `studenti` WHERE id = 2;

SELECT nume, prenume * FROM `studenti` 	WHERE id = 2;

DELETE FROM `studenti` WHERE id = 2;