# personalizando-acessos-automacao

# Personalizando Acessos e Automatizando Ações no MySQL

Este projeto apresenta a criação de views personalizadas, definição de permissões de acesso e implementação de triggers para automatização de ações no banco de dados.

## Views criadas:
1. Número de empregados por departamento e localidade
2. Lista de departamentos e seus gerentes
3. Projetos com maior número de empregados
4. Lista de projetos, departamentos e gerentes
5. Empregados com dependentes e se são gerentes

## Permissões de acesso:
- O usuário **gerente** possui acesso a todas as informações dos departamentos e funcionários.
- O usuário **funcionário** possui acesso limitado às informações básicas.

## Triggers implementados:
1. **before delete:** Garante que os dados de usuários excluídos sejam armazenados em uma tabela de backup.
2. **before update:** Armazena o histórico de salários de funcionários antes de qualquer atualização.

## Instruções:
1. Clone o repositório:
    ```bash
    git clone https://github.com/lvvieira/personalizando-acessos-automacao.git
    ```

2. Execute os scripts:
    ```bash
    source scripts/create_views.sql;
    source scripts/permissions.sql;
    source scripts/create_triggers.sql;
    ```
