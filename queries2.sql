-- Selezionare:

--1) Tutti gli studenti del corso di laurea in economia
SELECT 'students'.'name', 'students'.'surname', 'degrees'.'name'
FROM 'students'
JOIN 'degrees'
ON 'degrees'.'id' = 'students'.'degree'
WHERE 'degrees'.'name' = 'Corso di Laurea in Economia';

--2) Tutti i corsi di laurea del dipartimento di neuroscienze

SELECT 'degrees'.'name'
FROM 'degrees'
JOIN 'departements'
ON 'departments'.'id' = 'degrees'.'department_id'
WHERE 'departments'.name = Dipartimento di Neuroscienze;

--3) Tutti i corsi in cui insegna Fulvio Amato

SELECT 'courses'.'name', 'teachers'.'surname'
FROM 'courses'
JOIN 'course_teacher'
ON 'courses'.'id' = 'course_teacher'
JOIN 'teachers'
ON 'teachers'.'id' = 'course_teacher'.'teacher_id'
WHERE 'teachers'.'name' = 'Fulvio'
AND 'teachers'.'surname' = 'Amato'

--4) Tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome nome

SELECT 'students'.'name', 'students'.'surname', 'degrees'.'name'
FROM 'students'
JOIN 'degrees'
ON 'degrees'.'id' = 'students'.'degree_id'
JOIN 'departments'
ON 'departments'.'id' = 'degrees'.'department_id'
ORDER BY 'surname', 'students'.'name'

--5) Tutti i corsi di laurea con i relativi corsi ed insegnanti

SELECT 'degrees'.'name', 'courses'.'name', 'teachers'.'surname', 'teachers'.'name'
FROM 'degrees'
JOIN 'courses'
ON 'degrees'.'id' = 'courses'.'degree_id'
JOIN 'course_teacher'
ON 'course'.'id' = 'course_teacher'.'course_id'
JOIN 'teachers'
ON 'teachers'.'id' = 'course_teacher'.'teacher_id'

--5) Tutti i docenti che insegnano nel dipartimento di matematica

SELECT 'teachers'.'surname', 'teachers'.'name', 'courses'.'name', 'degrees'.'name', 'departments'.'name'
FROM 'teachers'
JOIN 'course_teacher'
ON 'teachers'.'id' = 'course_teacher'.'teacher_id'
JOIN 'courses'
ON 'course'.'id' = 'course_teacher'.'course_id'
JOIN 'degrees'
ON 'degrees'.'id' = 'courses'.'degree_id'
JOIN 'departments'
ON 'departments'.'id' = 'degrees'.'department_id'
