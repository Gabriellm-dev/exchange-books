const express = require('express');
const { PrismaClient } = require('@prisma/client');
const app = express();
const prisma = new PrismaClient();
const port = process.env.PORT || 3000;

app.use(express.json());

app.get('/', (req, res) => {
    res.send('API funcionando!');
});

app.listen(port, () => {
    console.log(`Servidor rodando em http://localhost:${port}`);
})

