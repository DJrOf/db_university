-- Query con SELECT

-- 1) Selezionare studenti nati nel 1990
SELECT *
FROM `students`
WHERE YEAR(date_of_birth);

-- 2) Selezionare tutti i corsi che valgono più di 10 crediti

SELECT *
FROM `courses`
WHERE cfu >= 10;

-- 3) Selezionare tutti gli studenti che hanno più di 30 anni (LA REFERENCE CHE HO UTILIZZATO RICHIEDEVA L'USO DELLA CHIOCCIOLA DAVANTI AL VALORE date_of_birth)

SELECT *
FROM `courses`
WHERE FLOOR(DATEDIFF(DAY, @date_of_birth, CURDATE) / 365.25) > 30;

-- 4) Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea

SELECT `name`, `period`, `year`
FROM `courses`
WHERE `year` = 1
AND `period` = `Ì semestre`;

-- 5) Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020

SELECT *
FROM `exams`
WHERE `date`= `2020-06-20`
AND HOUR(`hour`) > 14;

-- 6) Selezionare tutti i corsi di laurea magistrale

SELECT *
FROM `degrees`
WHERE `level` = `magistrale`;

-- 7) Selezionare tutti i corsi di laurea magistrale

SELECT COUNT(*)
FROM `departements`;

-- 8) Quanti sono gli insegnanti che non hanno un numero di telefono?

SELECT COUNT(*)
FROM `teachers`;
WHERE `phone`IS NULL;


-- Query con GROUP BY

-- 1) Contare quanti iscritti ci sono stati ogni anno (nello schema che ho caricato ho scritto ''enrollment'', con due 'l')

SELECT COUNT(*)
FROM `students`
GROUP BY YEAR(`enrolment_date`)

-- 2) Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(*) AS `same_build`, `office_address`
FROM `teachers`
GROUP BY `office_address`

-- 3) Calcolare la media dei voti di ogni appello d'esame

SELECT AVG(`vote`) AS `μ`, `exam_id`
FROM `exam_student`
GROUP BY `exam_id`
HAVING `vote`>= 18;

-- 4) Calcolare la media dei voti di ogni appello d'esame

SELECT COUNT(`*`), `department_id`
FROM `degrees`
GROUP BY `department_id`
HAVING `vote`>= 18;








