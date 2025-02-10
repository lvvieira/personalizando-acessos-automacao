-- View 1: Número de empregados por departamento e localidade
CREATE VIEW emp_por_departamento AS
SELECT D.Dname AS Departamento, L.Dlocation AS Localidade, COUNT(E.Ssn) AS Total_Empregados
FROM department D
JOIN dept_locations L ON D.Dnumber = L.Dnumber
JOIN employee E ON E.Dno = D.Dnumber
GROUP BY D.Dname, L.Dlocation;

-- View 2: Lista de departamentos e seus gerentes
CREATE VIEW lista_departamentos_gerentes AS
SELECT D.Dname AS Departamento, CONCAT(E.Fname, ' ', E.Lname) AS Gerente
FROM department D
JOIN employee E ON D.Mgr_ssn = E.Ssn;

-- View 3: Projetos com maior número de empregados (ordenado desc)
CREATE VIEW projetos_empregados AS
SELECT P.Pname AS Projeto, COUNT(W.Essn) AS Total_Empregados
FROM project P
JOIN works_on W ON P.Pnumber = W.Pno
GROUP BY P.Pname
ORDER BY Total_Empregados DESC;

-- View 4: Lista de projetos, departamentos e gerentes
CREATE VIEW projetos_departamentos_gerentes AS
SELECT P.Pname AS Projeto, D.Dname AS Departamento, CONCAT(E.Fname, ' ', E.Lname) AS Gerente
FROM project P
JOIN department D ON P.Dnum = D.Dnumber
JOIN employee E ON D.Mgr_ssn = E.Ssn;

-- View 5: Empregados com dependentes e se são gerentes
CREATE VIEW empregados_dependentes AS
SELECT E.Fname AS Empregado, E.Lname AS Sobrenome, 
       CASE 
           WHEN D.Mgr_ssn = E.Ssn THEN 'Sim' 
           ELSE 'Não' 
       END AS E_Gerente,
       COUNT(DT.Essn) AS Total_Dependentes
FROM employee E
LEFT JOIN dependent DT ON E.Ssn = DT.Essn
LEFT JOIN department D ON E.Ssn = D.Mgr_ssn
GROUP BY E.Fname, E.Lname, D.Mgr_ssn;
