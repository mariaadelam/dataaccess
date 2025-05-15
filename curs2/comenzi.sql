CREATE TABLE `magazin`.`produse` (
  `idprodus` INT UNSIGNED NOT NULL AUTO_INCREMENT , `numeprodus` VARCHAR(50) NOT NULL , `cantitate` INT NOT NULL DEFAULT '0' , `idfirma` INT NOT NULL , `firma` VARCHAR(50) NOT NULL , `adresafirma` VARCHAR(100) NULL , `modelprodus` VARCHAR(50) NOT NULL , `stocprodus` INT NOT NULL DEFAULT '0' , `pret` DECIMAL(10,2) NOT NULL , `categorieprodus` VARCHAR(100) NOT NULL , `descrierep` TEXT NOT NULL , `dataadaugare` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
   ) 
   ENGINE = InnoDB CHARSET=utf8 
   COLLATE utf8_general_ci;

   SELECT NOW(); -- DATA CURENTA
   SELECT CURDATE(); -- DATA CURENTA, DOAR ZIUA CURENTA
  SELECT titlu_curs FROM cursuri; -- selecteaza doar coloana titlu_curs din tabela cursuri
  SELECT nume,prenume FROM `student`; -- selecteaza doar coloanele nume si prenume din tabela student
  SELECT * FROM student WHERE an >=1 AND an <=2; -- selecteaza toate coloanele din tabela student unde an >=1 si an <=2
  SELECT * FROM student WHERE an BETWEEN 1 AND 2; -- selecteaza toate coloanele din tabela student unde an >=1 si an <=2
  UPDATE student SET status ='bursier' WHERE bursa IS NOT NULL; -- actualizeaza tabela student setand statusul bursier pentru toti studentii care au bursa
  SELECT nume AS 'Nume Profesor',prenume FROM profesor; -- selecteaza numele profesorului si prenumele din tabela profesor, redenumind coloana nume in Nume Profesor

  -- apl 4
  SELECT an AS An, COUNT(id) AS Nr_studenti FROM `student` ORDER BY `an` ASC; -- selecteaza an si numarul de studenti din tabela student, ordonand rezultatul dupa an in ordine crescatoare
  -- asc - ascendent
  SELECT an AS An, COUNT(id) AS Nr_studenti FROM `student` WHERE an = 1; -- selecteaza an si numarul de studenti din tabela student, unde an = 1
  SELECT an AS An, COUNT(id) AS Nr_studenti FROM `student` GROUP BY an; -- selecteaza an si numarul de studenti din tabela student, grupand rezultatul dupa an


-- apl 5
SELECT * FROM `student` WHERE YEAR(data_nastere) >=1996; -- selecteaza toate coloanele din tabela student unde anul nasterii este >= 1996
SELECT * FROM `profesor` WHERE grad_didactic ='I' OR grad_didactic ='II'; -- selecteaza toate coloanele din tabela profesor unde gradul didactic este I sau II
SELECT * FROM `profesor` WHERE grad_didactic IN('I', 'II'); -- selecteaza toate coloanele din tabela profesor unde gradul didactic este I sau II
SELECT * FROM `cursuri` WHERE AN=2 AND semestru = 2; -- selecteaza toate coloanele din tabela cursuri unde an = 2 si semestru = 2
SELECT * FROM `student` WHERE prenume LIKE 'ION'; -- selecteaza toate coloanele din tabela student unde prenumele incepe cu ION

SELECT * FROM `student` WHERE DAY(data_nastere) = '21' AND MONTH(data_nastere) = '09'; -- selecteaza toate coloanele din tabela student unde ziua nasterii este 21 si luna nasterii este 09
SELECT * FROM `student` WHERE bursa * 12 > 4000; -- selecteaza toate coloanele din tabela student unde bursa ANUALA este mai mare decat 4000
SELECT * FROM `student` ORDER BY nume, prenume DESC; -- selecteaza toate coloanele din tabela student ordonand rezultatul dupa nume si prenume in ordine descrescatoare
SELECT * FROM `student` ORDER BY nume ASC, prenume DESC; -- selecteaza toate coloanele din tabela student ordonand rezultatul dupa nume in ordine crescatoare si prenume in ordine descrescatoare

SELECT * FROM `profesor` ORDER BY rand();
SELECT * FROM `profesor` ORDER BY rand() LIMIT 3; -- selecteaza 3 randuri random din tabela profesor
SELECT * FROM `profesor` WHERE grad_didactic =1 ORDER BY rand() LIMIT 3; -- selecteaza 3 randuri random din tabela profesor unde gradul didactic este 1
SELECT * FROM `student` ORDER BY nume ASC LIMIT 5 OFFSET 10; -- selecteaza 5 randuri din tabela student incepand de la randul 10
SELECT an, COUNT(id) as nr_studenti  FROM `student` GROUP BY an HAVING nr_studenti >=9; -- selecteaza an si numarul de studenti din tabela student grupand rezultatul dupa an, avand conditia ca numarul de studenti sa fie >= 9`