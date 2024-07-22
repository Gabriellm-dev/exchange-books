-- CreateTable
CREATE TABLE "Usuario" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "rua" TEXT,
    "numero" TEXT,
    "bairro" TEXT,
    "cidade" TEXT NOT NULL,
    "estado" TEXT NOT NULL,
    "cep" TEXT NOT NULL,
    "dataCadastro" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "descricao" TEXT,
    "reputacaoId" INTEGER,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Livro" (
    "id" SERIAL NOT NULL,
    "titulo" TEXT NOT NULL,
    "autor" TEXT NOT NULL,
    "genero" TEXT NOT NULL,
    "estadoDeConservacao" TEXT NOT NULL,
    "descricao" TEXT,
    "dataPublicacao" TIMESTAMP(3),
    "numEdicao" TEXT,
    "disponivel" BOOLEAN NOT NULL DEFAULT true,
    "usuarioId" INTEGER NOT NULL,

    CONSTRAINT "Livro_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Troca" (
    "id" SERIAL NOT NULL,
    "data" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "solicitanteId" INTEGER NOT NULL,
    "solicitadoId" INTEGER NOT NULL,
    "livroSolicitadoId" INTEGER NOT NULL,
    "livroOferecidoId" INTEGER NOT NULL,
    "estado" TEXT NOT NULL,
    "avaliacaoLivro" TEXT,
    "trocaAutorizada" BOOLEAN NOT NULL DEFAULT false,
    "trocaSolicitada" BOOLEAN NOT NULL DEFAULT true,
    "classificacaoLivroId" INTEGER,

    CONSTRAINT "Troca_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Avaliacao" (
    "id" SERIAL NOT NULL,
    "nota" INTEGER NOT NULL,
    "comentario" TEXT,
    "data" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "avaliadorId" INTEGER NOT NULL,
    "trocaId" INTEGER NOT NULL,
    "avaliadoId" INTEGER NOT NULL,

    CONSTRAINT "Avaliacao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClassificacaoLivro" (
    "id" SERIAL NOT NULL,
    "nivel" TEXT NOT NULL,

    CONSTRAINT "ClassificacaoLivro_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Reputacao" (
    "id" SERIAL NOT NULL,
    "nivel" TEXT NOT NULL,

    CONSTRAINT "Reputacao_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_email_key" ON "Usuario"("email");

-- AddForeignKey
ALTER TABLE "Usuario" ADD CONSTRAINT "Usuario_reputacaoId_fkey" FOREIGN KEY ("reputacaoId") REFERENCES "Reputacao"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Livro" ADD CONSTRAINT "Livro_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Troca" ADD CONSTRAINT "Troca_solicitanteId_fkey" FOREIGN KEY ("solicitanteId") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Troca" ADD CONSTRAINT "Troca_solicitadoId_fkey" FOREIGN KEY ("solicitadoId") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Troca" ADD CONSTRAINT "Troca_livroSolicitadoId_fkey" FOREIGN KEY ("livroSolicitadoId") REFERENCES "Livro"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Troca" ADD CONSTRAINT "Troca_livroOferecidoId_fkey" FOREIGN KEY ("livroOferecidoId") REFERENCES "Livro"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Troca" ADD CONSTRAINT "Troca_classificacaoLivroId_fkey" FOREIGN KEY ("classificacaoLivroId") REFERENCES "ClassificacaoLivro"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Avaliacao" ADD CONSTRAINT "Avaliacao_avaliadorId_fkey" FOREIGN KEY ("avaliadorId") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Avaliacao" ADD CONSTRAINT "Avaliacao_trocaId_fkey" FOREIGN KEY ("trocaId") REFERENCES "Troca"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Avaliacao" ADD CONSTRAINT "Avaliacao_avaliadoId_fkey" FOREIGN KEY ("avaliadoId") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
