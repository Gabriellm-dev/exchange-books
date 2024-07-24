const express = require('express');
const router = express.Router();
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();


router.post('/avaliacoes', async (req, res) => {
  const { nota, comentario, avaliadorId, trocaId, avaliadoId } = req.body;
  try {
    const avaliacao = await prisma.avaliacao.create({
      data: {
        nota,
        comentario,
        avaliadorId,
        trocaId,
        avaliadoId
      }
    });
    res.status(201).json(avaliacao);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
