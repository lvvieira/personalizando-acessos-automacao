-- Criar usuário gerente com permissões específicas
CREATE USER 'gerente'@'%' IDENTIFIED BY 'senha_gerente';

-- Conceder permissões ao gerente
GRANT SELECT ON database_name.emp_por_departamento TO 'gerente'@'%';
GRANT SELECT ON database_name.lista_departamentos_gerentes TO 'gerente'@'%';
GRANT SELECT ON database_name.projetos_departamentos_gerentes TO 'gerente'@'%';

-- Criar usuário funcionário com permissões limitadas
CREATE USER 'funcionario'@'%' IDENTIFIED BY 'senha_funcionario';

-- Conceder acesso limitado ao funcionário
GRANT SELECT ON database_name.empregados_dependentes TO 'funcionario'@'%';
