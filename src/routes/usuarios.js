const express = require('express');
const router = express.Router();
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

router.post('/usuarios', async(req, res)=> {
    const {nome, email, senha, rua, numero, bairro, cidade,estado, cep, descricao, reputacaoID } = req.body;
    try {
        const usuario = await prisma.usuario.create({
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
                reputacaoId
            }
        });
        res.status(201).json(usuario);
    } catch (error) {
        res.status(500).json({ error: error.message});
    }
});

module.exports = router;