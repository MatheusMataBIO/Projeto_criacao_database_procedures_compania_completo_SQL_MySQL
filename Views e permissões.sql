USE company_MTT;

-- Criando Views

-- View funcionário_por_departamento_por_localização
CREATE VIEW employee_for_department_for_location AS
	SELECT 
		d.dname AS departament, 
        dl.dlocation AS location,
        COUNT(e.ssn) AS number_employees
	FROM
		employee e 
	JOIN departament d ON e.dno = d.dnumber 
    JOIN dept_locations dl ON d.dnumber = dl.dnumber
    GROUP BY d.dname, dl.dlocation;
    
SELECT * FROM employee_for_department_for_location;

-- View departamentos e seus gerentes
CREATE VIEW departments_and_managers AS
	SELECT 
		d.dname AS department,
        CONCAT(e.fname, ' ', e.lname) AS gerente,
        d.mgr_start_date
	FROM
		departament d
	JOIN employee e ON d.mgr_ssn = e.ssn;
    
SELECT * FROM departments_and_managers;

-- View projetos e seus funcionários
CREATE VIEW projects_plus_employee AS
	SELECT 
		p.pname AS project,
		COUNT(w.essn) AS number_employees
	FROM 
		project p
	JOIN works_on w ON p.pnumber = w.pno
	GROUP BY p.pname
	ORDER BY number_employees DESC;

SELECT * FROM projects_plus_employee;

-- View projetos e seus departamentos e gerentes
CREATE VIEW projects_departments_managers AS
	SELECT 
		p.pname AS project,
		d.dname AS department,
		CONCAT(e.fname, ' ', e.lname) AS manager
	FROM 
		project p
	JOIN departament d ON p.dnum = d.dnumber
	JOIN employee e ON d.mgr_ssn = e.ssn;

SELECT * FROM projects_departments_managers;

-- View para ver quem tem dependentes e se essa pessoa é gerente de algum departamento
CREATE VIEW employees_dependents_managers AS
	SELECT 
		DISTINCT CONCAT(e.fname, ' ', e.lname) AS employee,
        CASE 
			WHEN d.mgr_ssn IS NOT NULL THEN 'Yes'
            ELSE 'No'
		END AS has_manager_position
	FROM
		employee e 
	JOIN dependent dep ON e.ssn = dep.essn
    LEFT JOIN departament d ON e.ssn = d.mgr_ssn;

SELECT * FROM employees_dependents_managers;

-- Criando permissões 

-- Criar usuários com acesso remoto
CREATE USER 'manager'@'%' IDENTIFIED  BY 'password_manager';
CREATE USER 'employee'@'%' IDENTIFIED BY 'password_employee';

-- Permissões para o gerente (acesso a todas as views importantes)
GRANT SELECT ON employee_for_department_for_location TO 'manager'@'%';
GRANT SELECT ON departments_and_managers TO 'manager'@'%';
GRANT SELECT ON projects_plus_employee TO 'manager'@'%';
GRANT SELECT ON projects_departments_managers TO 'manager'@'%';
GRANT SELECT ON employees_dependents_managers TO 'manager'@'%';

-- Permissões para o funcionario (acesso limitado)
GRANT SELECT ON projects_plus_employee TO 'employee'@'%';

-- Aplicar mudanças
FLUSH PRIVILEGES;


	
		

