
  CREATE TABLE Incident_Types (
    incidentType_id INT AUTO_INCREMENT PRIMARY KEY,
    IncidentType_Name VARCHAR(100),
    IncidentType_Description TEXT,
    IncidentType_Category VARCHAR(100),
    IncidentType_Priority VARCHAR(100),
    IncidentType_Creation_Date DATETIME,
    IncidentType_Update_Date DATETIME,
    IncidentType_Status VARCHAR(20)
  );

  INSERT INTO Incident_Types (IncidentType_Name, IncidentType_Description, IncidentType_Category, IncidentType_Priority, IncidentType_Creation_Date, IncidentType_Update_Date, IncidentType_Status) VALUES 
  ('Phishing', 'Tentativa de e-mail de phishing', 'Segurança de e-mail', 'Alto', NOW(), NOW(), 'Ativo'),
  ('Malware', 'Malware detectado no dispositivo', 'Segurança de endpoint', 'Crítico', NOW(), NOW(), 'Ativo'),
  ('Violação de dados', 'Acesso não autorizado a dados', 'Segurança de dados', 'Crítico', NOW(), NOW(), 'Ativo'),
  ('Ataque DDoS', 'Negação de serviço distribuída', 'Segurança de rede', 'Alto', NOW(), NOW(), 'Ativo'),
  ('Ransomware', 'Ataque de ransomware', 'Segurança de endpoint', 'Crítico', NOW(), NOW(), 'Ativo');

  SELECT * FROM Incident_Types;

  -- Consultas Incident_Types
  SELECT * FROM Incident_Types;
  SELECT * FROM Incident_Types WHERE IncidentType_Priority = 'Crítico';
  SELECT * FROM Incident_Types WHERE IncidentType_Status = 'Ativo';
