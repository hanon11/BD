/*List of employees born between 1970 and 1995. Of these employees, we only want to list those whose province is defined and whose surname begins with Z. The information requested is in the table 'empleados' and the records must appear with the following header: ID, First name, Surname, Town.*/

SELECT emp_id 'ID', emp_nombre 'First name', emp_apellidos 'Surname', emp_poblacion 'Town'
FROM empleados
WHERE emp_nacimiento BETWEEN '1970-01-01' AND '1995-12-31' AND emp_apellidos LIKE 'Z%' AND emp_provincia IS NOT NULL
