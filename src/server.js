const express = require('express');
const { PrismaClient } = require('@prisma/client');
const app = express();
const prisma = new PrismaClient();
const port = process.env.PORT || 3000;

app.use(express.json());

const usuariosRouter = require('./routes/usuarios');
const livrosRouter = require('./routes/livros');
const trocasRouter = require('./routes/trocas');
const avaliacoesRouter = require('./routes/avaliacoes');

app.use('/api', usuariosRouter);
app.use('/api', livrosRouter);
app.use('/api', trocasRouter);
app.use('/api', avaliacoesRouter);

app.get('/', (req, res) => {
  res.send('API funcionando!');
});

app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});
