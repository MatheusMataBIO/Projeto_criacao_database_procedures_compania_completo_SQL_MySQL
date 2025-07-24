-- Consultas

USE company_MTT;

-- Qual o departamento com maior número de pessoas?

SELECT Dname, COUNT(*) As Total_Employees
FROM employee E
JOIN departament D ON E.Dno = D.Dnumber
GROUP BY Dname
ORDER BY Total_Employees DESC
LIMIT 1;

-- Como a junção e o agrupamento usam Dno e Dnumber, criamos índices nesses campos parar melhorar a performance da busca nessas tabelas

CREATE INDEX idx_employee_dno ON employee(Dno);
CREATE INDEX idx_departament_dnunmber ON departament(Dnumber);

-- Quais são os departamentos por cidade?

SELECT D.Dname, L.Dlocation
FROM departament D
JOIN dept_locations L ON D.Dnumber = L.Dnumber
ORDER BY D.Dname, L.Dlocation;

-- Índices criados para otimizar consultas frequentes envolvendo a coluna Dnumber,
-- usada como chave estrangeira em dept_locations e como chave primária em departament.
-- O índice composto em departament (Dnumber, Dname) também melhora buscas combinadas
-- por identificador e nome do departamento, comuns em filtros e joins.

CREATE INDEX idx_dept_locations_dnumber ON dept_locations(Dnumber);
CREATE INDEX idx_departament_dnumber_name ON departament(Dnumber, Dname);

-- Relação de empregados por departamento

SELECT D.Dname, E.Fname, E.Lname
FROM employee E
JOIN departament D ON E.Dno = D.Dnumber
ORDER BY D.Dname, E.Lname;

-- Verificando se os índices foram criados

SHOW INDEX FROM employee;
SHOW INDEX FROM departament;
SHOW INDEX FROM dept_locations;

-- Criando Procedures

-- Retorna a quantidade de funcionários por departamento

DELIMITER $$

CREATE PROCEDURE sp_total_employees_for_departament()
BEGIN
	SELECT D.Dname, COUNT(*) AS Total_Employees
	FROM employee E
	JOIN departament D ON E.Dno = D.Dnumber
	GROUP BY D.Dname
	ORDER BY Total_Employees DESC;
END$$

DELIMITER ;

-- Lista os departamentos presentes em cada cidade (localização)

DELIMITER $$

CREATE PROCEDURE sp_departaments_for_city()
BEGIN
	SELECT DISTINCT D.Dname, L.Dlocation
    FROM departament D
	JOIN dept_locations L ON D.Dnumber = L.Dnumber
    ORDER BY L.Dlocation, Dname;
END $$

DELIMITER ;

-- Retorna os funcionários agrupados por departamento, ordenados pelo sobrenome

DELIMITER $$

CREATE PROCEDURE sp_employees_for_departament()
BEGIN
	SELECT D.Dname, E.Fname, E.Lname
	FROM employee E
	JOIN departament D ON E.Dno = D.Dnumber
	ORDER BY D.Dname, E.Lname;
END $$

DELIMITER ;

-- Lista os funcionários, os projetos em que trabalham e a quantidade de horas

DELIMITER $$

CREATE PROCEDURE sp_projects_hours_for_employees()
BEGIN
	SELECT E.Fname, E.Lname, P.Pname, W.Hours
    FROM works_on W 
    JOIN employee E ON W.Essn = E.Ssn
    JOIN project P ON W.Pno = P.Pnumber
    ORDER BY E.Lname, P.Pname;
    
END $$

DELIMITER ;

-- Testando

CALL sp_total_employees_for_departament();
CALL sp_departaments_for_city();
CALL sp_projects_hours_for_employees();
CALL sp_employees_for_departament();
