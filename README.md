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
