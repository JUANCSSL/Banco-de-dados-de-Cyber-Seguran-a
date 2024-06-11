CREATE TABLE Incidents (
  incidents_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  incidentType_id INT,
  Descriptionn TEXT,
  Severity VARCHAR(20),
  Date_Reported DATETIME,
  Damage_to_Device VARCHAR(100),
  What_Damage VARCHAR(200),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (incidentType_id) REFERENCES Incident_Types(incidentType_id)
);

INSERT INTO Incidents (user_id, incidentType_id, Descriptionn, Severity, Date_Reported, Damage_to_Device, What_Damage) VALUES 
(1, 1, 'E-mail de phishing recebido e relatado', 'Médio', NOW(), 'Sistema de e-mail', 'Nenhum'),
(2, 2, 'Malware detectado no dispositivo do gerente de RH', 'Alta', NOW(), 'Estação de trabalho', 'Sistema comprometido'),
(3, 3, 'Violação de dados detectada no departamento financeiro', 'Crítico', NOW(), 'Database Server', 'Dados exfiltrados'),
(4, 4, 'Ataque DDoS no site da empresa', 'Alto', NOW(), 'Web Server', 'Website down'),
(5, 5, 'Ransomware arquivo de usuário criptografado', 'Crítico', NOW(), 'Local de trabalho', 'Arquivos criptografados');


-- Consultas Incidents 
SELECT * FROM Incidents;
SELECT * FROM Incidents WHERE Date_Reported > '2024-01-01';
SELECT * FROM Incidents WHERE Severity = 'Alto'; 
