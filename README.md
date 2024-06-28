# Cybershield Database 

## Introdução
A cibersegurança é crucial na era digital para proteger dados pessoais e empresariais, prevenir ataques cibernéticos, garantir a continuidade dos negócios e cumprir regulamentações. Além disso, ela aumenta a confiança dos clientes e parceiros, protege infraestruturas críticas e acompanha a evolução das ameaças cibernéticas. Medidas como firewalls, antivírus, criptografia, autenticação de dois fatores, backups regulares e educação dos usuários são essenciais para mitigar riscos e proteger informações sensíveis.

## Estrutura do Banco de Dados

### Esquema
O banco de dados `Cybershieldb` contém as seguintes tabelas:
- `Departments`: Informação sobre os departamentos da empresa.
- `Users`: Informação sobre os usuários, incluindo referência ao departamento.
- `Incident_types`: Tipos de incidentes de cibersegurança.
- `Incidents`: Incidentes relatados, incluindo referências ao tipo de incidente e ao usuário.
- `Incident_comments`: Comentários sobre os incidentes.
- `Reduction_actions`: Ações tomadas para reduzir incidentes, incluindo referências aos departamentos e incidentes.

### Tabelas e Consultas

#### Criação do Banco de Dados e Tabelas

```sql
CREATE DATABASE Cybershieldb;
USE Cybershieldb;

CREATE TABLE Departments (
  department_id INT AUTO_INCREMENT PRIMARY KEY,
  token VARCHAR(20),
  manager VARCHAR(100),
  number_of_employees INT,
  commentary TEXT
);

CREATE TABLE Users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  department_id INT,
  username VARCHAR(50),
  passcode VARCHAR(50),
  email VARCHAR(50),
  job_title VARCHAR(50),
  circumstance VARCHAR(50),
  phone_number VARCHAR(50),
  FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Incident_types (
  incident_type_id INT AUTO_INCREMENT PRIMARY KEY,
  incident_type_name VARCHAR(100),
  incident_type_description TEXT,
  incident_type_category VARCHAR(100),
  incident_type_priority VARCHAR(100),
  incident_type_creation_date DATETIME,
  incident_type_update_date DATETIME,
  incident_type_status VARCHAR(20)
);

CREATE TABLE Incidents (
  incidents_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  incident_type_id INT,
  descriptionn TEXT,
  severity VARCHAR(20),
  date_reported DATETIME,
  damage_to_device VARCHAR(100),
  what_damage VARCHAR(200),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (incident_type_id) REFERENCES Incident_types(incident_type_id)
);

CREATE TABLE Incident_comments (
  comment_id INT AUTO_INCREMENT PRIMARY KEY,
  incident_id INT,
  user_id INT,
  commentary TEXT,
  make DATETIME,
  improvement DATETIME,
  FOREIGN KEY (incident_id) REFERENCES Incidents(incidents_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Reduction_actions (
  action_id INT AUTO_INCREMENT PRIMARY KEY,
  department_id INT,
  incident_id INT,
  action_date DATETIME,
  action_taken VARCHAR(100),
  effectiveness VARCHAR(100),
  FOREIGN KEY (department_id) REFERENCES Departments(department_id),
  FOREIGN KEY (incident_id) REFERENCES Incidents(incidents_id)
);

Inserção de Dados

INSERT INTO Departments (token, manager, number_of_employees, commentary) VALUES 
('IT', 'Isaias', '25', 'Departamento de Tecnologia da Informação'),
('HR', 'Natália', '15', 'Departamento de Recursos Humanos'),
('FIN', 'Debora', '20', 'Departamento Financeiro'),
('OPS', 'Thiago', '30', 'Departamento de Operações'),
('SEC', 'Juan', '10', 'Departamento de Segurança');

INSERT INTO Users (department_id, username, passcode, email, job_title, circumstance, phone_number) VALUES 
(1, 'Zaza', 'password123', 'zaza@example.com', 'Gerenciamento de TI', 'Ativo', '(21) 9989-9876'),
(2, 'Nat', 'password123', 'NAth@example.com', 'Gerenciamento de RH', 'Ativo', '(21) 9999-5686'),
(3, 'Debinha', 'password123', 'Debinha@example.com', 'Gerente Financeiro', 'Ativo', '(21) 9959-5480'),
(4, 'TH', 'password123', 'THwn@example.com', 'Gerente das operações', 'Ativo', '(21) 9329-5796'),
(5, 'Erro J', 'password123', 'ErroJte@example.com', 'Gerente da segurança', 'Ativo', '(21) 9864-5623');

INSERT INTO Incident_types (incident_type_name, incident_type_description, incident_type_category, incident_type_priority, incident_type_creation_date, incident_type_update_date, incident_type_status) VALUES 
('Phishing', 'Tentativa de e-mail de phishing', 'Segurança de e-mail', 'Alto', NOW(), NOW(), 'Ativo'),
('Malware', 'Malware detectado no dispositivo', 'Segurança de endpoint', 'Crítico', NOW(), NOW(), 'Ativo'),
('Violação de dados', 'Acesso não autorizado a dados', 'Segurança de dados', 'Crítico', NOW(), NOW(), 'Ativo'),
('Ataque DDoS', 'Negação de serviço distribuída', 'Segurança de rede', 'Alto', NOW(), NOW(), 'Ativo'),
('Ransomware', 'Ataque de ransomware', 'Segurança de endpoint', 'Crítico', NOW(), NOW(), 'Ativo');

INSERT INTO Incidents (user_id, incident_type_id, descriptionn, severity, date_reported, damage_to_device, what_damage) VALUES 
(1, 1, 'E-mail de phishing recebido e relatado', 'Médio', NOW(), 'Sistema de e-mail', 'Nenhum'),
(2, 2, 'Malware detectado no dispositivo do gerente de RH', 'Alta', NOW(), 'Estação de trabalho', 'Sistema comprometido'),
(3, 3, 'Violação de dados detectada no departamento financeiro', 'Crítico', NOW(), 'Database Server', 'Dados exfiltrados'),
(4, 4, 'Ataque DDoS no site da empresa', 'Alto', NOW(), 'Web Server', 'Website down'),
(5, 5, 'Ransomware arquivo de usuário criptografado', 'Crítico', NOW(), 'Local de trabalho', 'Arquivos criptografados');

INSERT INTO Incident_comments (incident_id, user_id, commentary, make, improvement) VALUES 
(1, 1, 'Investigando a origem do e-mail de phishing', NOW(), NOW()),
(2, 2, 'Verificação de malware no dispositivo', NOW(), NOW()),
(3, 3, 'Notificar as partes afetadas sobre violação de dados', NOW(), NOW()),
(4, 4, 'Mitigação de ataques DDoS', NOW(), NOW()),
(5, 5, 'Restauração de arquivos a partir do backup', NOW(), NOW());

INSERT INTO Reduction_actions (department_id, incident_id, action_date, action_taken, effectiveness) VALUES 
(1, 1, NOW(), 'Treinamento de phishing para a equipe', 'Alto'),
(2, 2, NOW(), 'Software anti-malware instalado', 'Médio'),
(3, 3, NOW(), 'Controles de acesso reforçados', 'Alto'),
(4, 4, NOW(), 'Proteção contra DDoS implementada', 'Médio'),
(5, 5, NOW(), 'Processos de backup aprimorados', 'Alto');

-- Consultas para Departments
SELECT * FROM Departments;
SELECT * FROM Departments WHERE number_of_employees > 20;
SELECT * FROM Departments WHERE token = 'IT';

-- Consultas para Users
SELECT * FROM Users;
SELECT * FROM Users WHERE department_id = 1;
SELECT * FROM Users WHERE circumstance = 'Ativo';

-- Consultas para Incident_types
SELECT * FROM Incident_types;
SELECT * FROM Incident_types WHERE incident_type_priority = 'Crítico';
SELECT * FROM Incident_types WHERE incident_type_status = 'Ativo';

-- Consultas para Incidents
SELECT * FROM Incidents;
SELECT * FROM Incidents WHERE date_reported > '2024-01-01';
SELECT * FROM Incidents WHERE severity = 'Alto';

-- Consultas para Incident_comments
SELECT * FROM Incident_comments;
SELECT * FROM Incident_comments WHERE incident_id = 1;
SELECT * FROM Incident_comments WHERE user_id = 1;

-- Consultas para Reduction_actions
SELECT * FROM Reduction_actions;
SELECT * FROM Reduction_actions WHERE incident_id = 1;
SELECT * FROM Reduction_actions WHERE department_id = 1;

'''
##Links para as tabelas e graficos
[Tabela Incidentes](https://github.com/JUANCSSL/Banco-de-dados-da-cyber-seguran-a/blob/juan/Tabelas%20e%20graficos.pdf)
[Tabela Tipos de incidentes](https://github.com/JUANCSSL/Banco-de-dados-da-cyber-seguran-a/blob/Debora/Debora/Tabelas%20e%20graficos%20Debora%20(1).pdf)
[Tabela Comentario de incidentes](https://github.com/JUANCSSL/Banco-de-dados-da-cyber-seguran-a/blob/thiago/Thiago/Diagrama.png)(https://github.com/JUANCSSL/Banco-de-dados-da-cyber-seguran-a/blob/thiago/Thiago/Tabela.png)
[Tabela Usuarios](https://github.com/JUANCSSL/Banco-de-dados-da-cyber-seguran-a/blob/Natalia/Graficos%20Table%20Users%20(1).pdf)
[Tabela Departamentos](https://github.com/JUANCSSL/Banco-de-dados-da-cyber-seguran-a/blob/Ligya/Ligya/Tabelas%20e%20gr%C3%A1ficos_%20Ligya%20.pdf)
[Tabela Reduçoes de acoes](https://github.com/JUANCSSL/Banco-de-dados-da-cyber-seguran-a/blob/Isaias/Isaias/Graficos%20isaias.png)(https://github.com/JUANCSSL/Banco-de-dados-da-cyber-seguran-a/blob/Isaias/Isaias/Tabela%20isaias%20Dbdiagram.pdf)(https://github.com/JUANCSSL/Banco-de-dados-da-cyber-seguran-a/blob/Isaias/Isaias/Br%20modelo%20isaias.pdf)


