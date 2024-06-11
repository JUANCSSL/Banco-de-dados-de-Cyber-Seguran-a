CREATE TABLE Incident_Comments (
  comment_id INT AUTO_INCREMENT PRIMARY KEY,
  incident_id INT,
  user_id INT,
  Commentt TEXT,
  Createe DATETIME,
  Updatee DATETIME,
  FOREIGN KEY (incident_id) REFERENCES Incidents(incidents_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

NSERT INTO Incident_Comments (incident_id, user_id, Commentt, Createe, Updatee) VALUES 
(1, 1, 'Investigando a origem do e-mail de phishing', NOW(), NOW()),
(2, 2, 'Verificação de malware no dispositivo', NOW(), NOW()),
(3, 3, 'Notificar as partes afetadas sobre violação de dados',NOW(), NOW()),
(4, 4, 'Mitigação de ataques DDoS', NOW(), NOW()),
(5, 5, 'Restauração de arquivos a partir do backup', NOW(), NOW());

SELECT * FROM Incident_Types;
SELECT * FROM Incident_Types WHERE IncidentType_Priority = 'Crítico';
SELECT * FROM Incident_Types WHERE IncidentType_Status = 'Ativo';


