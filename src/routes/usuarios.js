const express = require('express');
const { PrismaClient } = require('@prisma/client');
const router = express.Router();
const prisma = new PrismaClient();

// Obter todos os usuários
router.get('/usuarios', async (req, res) => {
  const usuarios = await prisma.usuario.findMany();
  res.json(usuarios);
});

// Criar um novo usuário
router.post('/usuarios', async (req, res) => {
  const { nome, email, senha, rua, numero, bairro, cidade, estado, cep, descricao } = req.body;
  const reputacaoId = 1; // Definindo um valor padrão de reputação (você pode alterar conforme necessário)

  try {
    const novoUsuario = await prisma.usuario.create({
      data: {
        nome,
        email,
        senha,
        rua,
        numero,
        bairro,
        cidade,
        estado,
        cep,
        descricao,
        reputacaoId, // Definindo a reputação padrão aqui
      },
    });
    res.json(novoUsuario);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

// Obter um usuário específico
router.get('/usuarios/:id', async (req, res) => {
  const { id } = req.params;
  const usuario = await prisma.usuario.findUnique({ where: { id: parseInt(id) } });
  res.json(usuario);
});

// Atualizar um usuário específico
router.put('/usuarios/:id', async (req, res) => {
  const { id } = req.params;
  const { nome, email, senha, rua, numero, bairro, cidade, estado, cep, descricao, reputacaoId } = req.body;

  try {
    const usuarioAtualizado = await prisma.usuario.update({
      where: { id: parseInt(id) },
      data: {
        nome,
        email,
        senha,
        rua,
        numero,
        bairro,
        cidade,
        estado,
        cep,
        descricao,
        reputacaoId,
      },
    });
    res.json(usuarioAtualizado);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

// Deletar um usuário específico
router.delete('/usuarios/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const usuarioDeletado = await prisma.usuario.delete({ where: { id: parseInt(id) } });
    res.json(usuarioDeletado);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

module.exports = router;
