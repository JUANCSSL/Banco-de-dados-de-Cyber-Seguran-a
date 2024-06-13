const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const path = require('path');

const app = express();
const port = 3000;

const cors = require('cors');
app.use(cors());

// Configurar para processar dados do formulário
app.use(bodyParser.urlencoded({ extended: true }));

app.use(bodyParser.json());

// Configurar conexão com o banco de dados MySQL
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'password',
  database: 'cybershield2'
});

db.connect((err) => {
  if (err) throw err;
  console.log('Conectado ao banco de dados MySQL!');
});

// Rota para processar dados do formulário
app.post('/submit', (req, res) => {
  const { name, email, departament, departamentt, mensagem } = req.body;

console.log(req.body)

  const sql = 'INSERT INTO Usuarios (Seu_nome,Email,Departamento,Tipo_incidente, Descreva) VALUES (?, ?, ?, ?, ?)';
  db.query(sql, [name, email, departament, departamentt, mensagem  ], (err, result) => {
    if (err) throw err;
    console.log('Dados inseridos com sucesso!');
    res.send('Dados inseridos com sucesso!');
  });
});

app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});

