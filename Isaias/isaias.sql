CREATE TABLE ReductionActions (
  action_id INT AUTO_INCREMENT PRIMARY KEY,
  Department_id INT,
  incident_id INT,
  Action_Date DATETIME,
  Action_Taken VARCHAR(100),
  Effectiveness VARCHAR(100),
  FOREIGN KEY (Department_id) REFERENCES Departments(Department_id),
  FOREIGN KEY (incident_id) REFERENCES Incidents(incidents_id)
);

INSERT INTO ReductionActions (Department_id, incident_id, Action_Date, Action_Taken, Effectiveness) VALUES 
(1, 1, NOW(), 'Treinamento de phishing para a equipe', 'Alto'),
(2, 2, NOW(), 'Software anti-malware instalado', 'Médio'),
(3, 3, NOW(), 'Controles de acesso reforçados', 'Alto'),
(4, 4, NOW(), 'Implemented DDoS protection', 'Medio'),
(5, 5, NOW(), 'Processos de backup aprimorados', 'Alto');


-- Consultas ReductionActions
SELECT * FROM ReductionActions;
SELECT * FROM ReductionActions WHERE incident_id = 1;
SELECT * FROM ReductionActions WHERE Department_id = 1;