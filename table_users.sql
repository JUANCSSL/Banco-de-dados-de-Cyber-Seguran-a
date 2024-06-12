CREATE TABLE Users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  Department_id INT,
  Username VARCHAR(50),
  Passwordd VARCHAR(50),
  Email VARCHAR(50),
  Job_title VARCHAR(50),
  Statuss VARCHAR(50),
  Phone_Number VARCHAR(50),
  FOREIGN KEY (Department_id) REFERENCES Departments(Department_id)
);

INSERT INTO Users (Department_id, Username, Passwordd, Email, Job_title, Statuss, Phone_Number) VALUES 
(1, 'Zaza', 'password123', 'zaza@example.com', 'Gerenciamento de TI', 'Ativo', '(21) 9989-9876'),
(2, 'Nat', 'password123', 'NAth@example.com', 'Gerenciamento de RH', 'Ativo', '(21) 9999-5686'),
(3, 'Debinha', 'password123', 'Debinha@example.com', 'Gerente Financeiro', 'Ativo', '(21) 9959-5480'),
(4, 'TH', 'password123', 'THwn@example.com', 'Gerente das operações', 'Ativo', '(21) 9329-5796'),
(5, 'Erro J', 'password123', 'ErroJte@example.com', 'Gerente da segurança', 'Ativo', '123-456-7894');

-- Consultas Users 
SELECT * FROM Users;
SELECT * FROM Users WHERE Department_id = 1;
SELECT * FROM Users WHERE Statuss = 'Ativo';