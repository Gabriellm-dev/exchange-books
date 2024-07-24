const express = require('express');
const router = express.Router();
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

router.post('/livros', async (req, res) => {
  const { titulo, autor, genero, estadoDeConservacao, descricao, dataPublicacao, numEdicao, usuarioId } = req.body;
  try {
    const livro = await prisma.livro.create({
      data: {
        titulo,
        autor,
        genero,
        estadoDeConservacao,
        descricao,
        dataPublicacao: new Date(dataPublicacao),
        numEdicao,
        usuarioId
      }
    });
    res.status(201).json(livro);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;