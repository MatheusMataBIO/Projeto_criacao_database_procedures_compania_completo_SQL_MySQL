USE company_MTT;

-- Criar tabela de auditoria se não existir
CREATE TABLE IF NOT EXISTS employee_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    action_type VARCHAR(50),
    action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--  Auditoria de inserção de empregados
--  Mantém histórico de quando e quem foi adicionado
DELIMITER $$

CREATE TRIGGER trg_employee_insert_audit
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (employee_id, action_type)
    VALUES (NEW.Ssn, 'INSERT');
END$$

DELIMITER ;


-- Bloquear exclusão de empregado com dependentes
-- Protege integridade de dados
-- Evita perda de registros de dependentes por exclusão acidental
DELIMITER $$

CREATE TRIGGER trg_prevent_delete_employee_with_dependents
BEFORE DELETE ON employee
FOR EACH ROW
BEGIN
    DECLARE dependents_count INT;

    SELECT COUNT(*) INTO dependents_count
    FROM dependent
    WHERE Essn = OLD.Ssn;  

    IF dependents_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'It is not possible to exclude employees with dependents.';
    END IF;
END$$

DELIMITER ;

-- Atualizar data de modificação de projetos
-- Facilita rastrear alterações em projetos
-- Útil para gestão de mudanças
ALTER TABLE project ADD COLUMN Last_Modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

DELIMITER $$

CREATE TRIGGER trg_project_update_timestamp
BEFORE UPDATE ON project
FOR EACH ROW
BEGIN
    SET NEW.Last_Modified = CURRENT_TIMESTAMP;
END$$

DELIMITER ;

-- Garantir que departamento existe ao inserir empregado
-- Evita inserções inválidas
-- Mantém consistência entre employee e department
DELIMITER $$

CREATE TRIGGER trg_check_department_exists
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    DECLARE dept_exists INT;

    SELECT COUNT(*) INTO dept_exists
    FROM departament
    WHERE Dnumber = NEW.Dno;  

    IF dept_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'The informed department does not exist.';
    END IF;
END$$

DELIMITER ;
