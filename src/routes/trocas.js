const express = require('express');
const router = express.Router();
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();


router.post('/trocas', async (req, res) => {
  const { solicitanteId, solicitadoId, livroSolicitadoId, livroOferecidoId } = req.body;
  try {
    const troca = await prisma.troca.create({
      data: {
        solicitanteId,
        solicitadoId,
        livroSolicitadoId,
        livroOferecidoId,
        estado: 'Solicitado'
      }
    });
    res.status(201).json(troca);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
