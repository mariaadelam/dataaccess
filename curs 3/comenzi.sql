SELECT * FROM `cursuri` c NATURAL JOIN note n; -- returns all columns from cursuri and note, dar daca exista o col. cu acelasi nume in ambele tabele, se va returna doar o singura data
SELECT c.titlu_curs, COUNT(n.id_nota) AS nr_note FROM `cursuri` c NATURAL JOIN note n GROUP BY n.id_curs; -- returns titlu_curs and number of notes for each course
SELECT * FROM `student` CROSS JOIN note; -- returns all columns from student and note, but the result set will be very large, face productul cartezian
SELECT * FROM `student` JOIN note; -- returns all columns from student and note, but the result set will be very large, face productul cartezian, === cross join
SELECT * FROM `student` INNER JOIN note; -- returns all columns from student and note, but the result set will be very large, face productul cartezian
SELECT * FROM `student` ,note; -- returns all columns from student and note, but the result set will be very large, face productul cartezian
SELECT s.id FROM `student` AS s CROSS JOIN note AS n CROSS JOIN cursuri AS c; -- returns all columns from student, note and cursuri, but the result set will be very large, face productul cartezian
SELECT s.id, n.valoare FROM student AS s INNER JOIN note AS n ON s.id = n.id_student; -- returns id and valoare for all students and their notes
SELECT s.id, s.nume, s.prenume, n.valoare FROM student AS s INNER JOIN note AS n ON s.id = n.id_student WHERE s.id =101; -- returns id, nume, prenume and valoare for student with id 101
SELECT s.id, s.nume, s.prenume, n.valoare, c.titlu_curs FROM student AS s INNER JOIN note AS n ON s.id = n.id_student INNER JOIN cursuri AS c ON c.id_curs = n.id_curs WHERE s.id =101; -- returns id, nume, prenume, valoare and titlu_curs for student with id 101
-- ce note a pus un profesor la un anumit curs
SELECT nume, prenume,titlu_curs FROM `profesor` AS p LEFT JOIN didactic AS d ON p.id = d.id_prof LEFT JOIN cursuri AS c ON d.id_curs = c.id_curs WHERE id=1; -- returns nume, prenume and titlu_curs for professor with id 1
-- cate cursuri sunt fara profesor
SELECT * FROM `cursuri` WHEREid_curs NOT IN (SELECT id_curs FROM didactic); -- subinterogare

-- cati nu s-au inscris la niciun curs
SELECT * FROM `student` WHERE id NOT IN (SELECT id_student FROM note);

--cati studenti au minim 2 note?

SELECT * FROM `student` WHERE id NOT IN (SELECT id_student FROM note);

-- 4.Cati studentiau minim 2 note/ sunt inscrisi la minim 2 cursuri
SELECT id_student, count(id_student) as nr FROM `note` group by id_student having nr >=2 ;
SELECT id_student, s.nume, s.prenume, count(id_student) as nr FROM `note` AS n RIGHT JOIN student AS s ON n.id_student = s.id group by id_student having nr >=2;


/*SELECT id_student, s.nume, s.prenume, count(id_student) as nr FROM `note` AS n
RIGHT JOIN student AS s ON n.id_student = s.id
group by id_student having nr >=2;
*/
SELECT id_student, s.nume, s.prenume, count(id_student) as nr FROM student AS s 
LEFT JOIN note AS n ON s.id = n.id_student  
group by id_student having nr >=2;


-- 5.Cati strudenti si profesori isi serbeaza ziua de Sf. ION?
(SELECT nume, prenume FROM `student` where prenume like 'ion%') UNION (select nume,prenume from profesor where prenume like 'ion%');

-- returns nume, prenume and Type for all students and professors with first name starting with 'ion'
(SELECT nume, prenume, (CASE WHEN id > 20 THEN 'student' END) AS Type FROM `student` where prenume like 'ion%' )
UNION 
(select nume,prenume,(CASE WHEN id <= 20 THEN 'profesor' END) AS Type from profesor where prenume like 'ion%'); 
-- 6.Pentru un anumit student doresc sa vad ce note are la cursurile sale
select s.nume,s.prenume, n.valoare, c.titlu_curs from student s left join note n on s.id = n.id_student inner join cursuri c on n.id_curs= c.id_curs where s.id=101 ;
-- 7.Calculati media notelor primite pentru un anumit student
select s.nume,s.prenume, avg(n.valoare) from student s left join note n on s.id = n.id_student where s.id=101; 
select s.nume,s.prenume, FORMAT (avg(n.valoare), 1) from student s left join note n on s.id = n.id_student where s.id=101; -- afisare cu o zecimala
select s.nume,s.prenume, FORMAT (avg(n.valoare), 1) AS media_totala from student s left join note n on s.id = n.id_student group by n.id_student;

-- 8. media fiecarui student 
select s.nume,s.prenume, avg(n.valoare) from student s left join note n on s.id = n.id_student group by s.id ;
-- 9. media studentilor pe ani
select s.an, avg(n.valoare) from student s left join note n on s.id = n.id_student group by s.an