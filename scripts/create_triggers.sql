-- Tabela de backup para deletar usuários
CREATE TABLE backup_users (
    user_id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    data_exclusao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger before delete: Backup dos dados antes da exclusão
DELIMITER //
CREATE TRIGGER before_delete_user
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    INSERT INTO backup_users (user_id, nome, email)
    VALUES (OLD.id, OLD.nome, OLD.email);
END;
//
DELIMITER ;

-- Tabela de histórico de salários
CREATE TABLE salary_history (
    employee_id INT,
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger before update: Histórico de salários
DELIMITER //
CREATE TRIGGER before_update_salary
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
    INSERT INTO salary_history (employee_id, old_salary, new_salary)
    VALUES (OLD.Ssn, OLD.Salary, NEW.Salary);
END;
//
DELIMITER ;
