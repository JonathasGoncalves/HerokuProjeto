-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 22/04/2020 às 15:29
-- Versão do servidor: 5.7.29
-- Versão do PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `selitac_portal`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `arquivo_unimed`
--

CREATE TABLE `arquivo_unimed` (
  `id` int(11) UNSIGNED NOT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `data` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `associados`
--

CREATE TABLE `associados` (
  `id` int(11) DEFAULT NULL,
  `CODIGO` int(11) DEFAULT NULL,
  `CODIGO_CACAL` int(11) DEFAULT NULL,
  `MATRICULA` int(11) DEFAULT NULL,
  `NOME` varchar(100) DEFAULT NULL,
  `ENDERECO` varchar(100) DEFAULT NULL,
  `NUMERO` varchar(6) DEFAULT NULL,
  `BAIRRO` varchar(20) DEFAULT NULL,
  `UF` varchar(2) DEFAULT NULL,
  `CODMUN` varchar(5) DEFAULT NULL,
  `MUNICIPIO` varchar(15) DEFAULT NULL,
  `CEP` varchar(8) DEFAULT NULL,
  `CPF_CNPJ` varchar(14) DEFAULT NULL,
  `TIPO` char(1) DEFAULT NULL,
  `INSCRICAO` varchar(18) DEFAULT NULL,
  `NIRF` varchar(11) DEFAULT NULL,
  `INCRA` varchar(12) DEFAULT NULL,
  `ddd_tel` varchar(3) DEFAULT NULL,
  `TEL` varchar(15) DEFAULT NULL,
  `ddd_celular` varchar(13) DEFAULT NULL,
  `CELULAR` varchar(15) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `SENHA` varchar(8) DEFAULT NULL,
  `cota` bigint(20) DEFAULT NULL,
  `DT_NIVER` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `titulo` varchar(300) NOT NULL,
  `arquivo_nome` varchar(300) NOT NULL,
  `frase_alt_title` varchar(300) NOT NULL,
  `url` text,
  `target` enum('1','2') NOT NULL DEFAULT '1',
  `visibilidade` enum('1','2') NOT NULL DEFAULT '1',
  `codigo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `celular`
--

CREATE TABLE `celular` (
  `id` int(11) NOT NULL,
  `matricula` int(9) DEFAULT NULL,
  `cooperado` varchar(100) DEFAULT NULL,
  `celular` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `chamados`
--

CREATE TABLE `chamados` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `assunto` varchar(250) NOT NULL,
  `data` datetime NOT NULL,
  `data_modificado` datetime DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `chamados_arquivos`
--

CREATE TABLE `chamados_arquivos` (
  `id` int(11) NOT NULL,
  `chamado_id` int(11) NOT NULL,
  `arquivo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `chamados_mensagens`
--

CREATE TABLE `chamados_mensagens` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `cliente_nome` varchar(255) NOT NULL,
  `chamado_id` int(11) NOT NULL,
  `mensagem` longtext NOT NULL,
  `data` datetime NOT NULL,
  `tipo` enum('1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `configuracao`
--

CREATE TABLE `configuracao` (
  `id` int(11) NOT NULL,
  `banner_destaque` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta-capital-regpag`
--

CREATE TABLE `conta-capital-regpag` (
  `id` int(11) NOT NULL,
  `codigo` int(6) DEFAULT NULL,
  `VALOR` double DEFAULT NULL,
  `EMISSAO` datetime DEFAULT NULL,
  `VENCIMENTO` datetime DEFAULT NULL,
  `historico` varchar(50) DEFAULT NULL,
  `BAIXA` datetime DEFAULT NULL,
  `RECPAG` char(1) DEFAULT NULL,
  `NATUREZA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta-capital-resumo`
--

CREATE TABLE `conta-capital-resumo` (
  `id` int(11) NOT NULL,
  `codigo` int(6) DEFAULT NULL,
  `dt_admissao` datetime DEFAULT NULL,
  `matricula` int(9) DEFAULT NULL,
  `vlr_subs` double DEFAULT NULL,
  `vlr_integra` double DEFAULT NULL,
  `dt_movimento` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cooperados`
--

CREATE TABLE `cooperados` (
  `id` int(11) NOT NULL,
  `codigo` int(6) DEFAULT NULL,
  `codigo_cacal` int(6) DEFAULT NULL,
  `matricula` int(9) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cpf_cnpj` varchar(14) DEFAULT NULL,
  `tipo` varchar(4) DEFAULT NULL,
  `ddd_tel` varchar(3) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `ddd_celular` varchar(3) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(8) DEFAULT NULL,
  `cota` bigint(20) DEFAULT NULL,
  `ENDERECO` varchar(100) DEFAULT NULL,
  `NUMERO` varchar(6) DEFAULT NULL,
  `BAIRRO` varchar(20) DEFAULT NULL,
  `UF` varchar(2) DEFAULT NULL,
  `CODMUN` varchar(5) DEFAULT NULL,
  `MUNICIPIO` varchar(15) DEFAULT NULL,
  `CEP` varchar(8) DEFAULT NULL,
  `INSCRICAO` varchar(18) DEFAULT NULL,
  `NIRF` varchar(11) DEFAULT NULL,
  `INCRA` varchar(12) DEFAULT NULL,
  `primeiro_acesso` int(11) NOT NULL DEFAULT '0',
  `DT_NIVER` datetime DEFAULT NULL,
  `extrato_digital` enum('1','2') NOT NULL DEFAULT '2',
  `exibir_pop_up_extrato_digital` enum('1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `demonstrativo-mensagens`
--

CREATE TABLE `demonstrativo-mensagens` (
  `id` int(11) NOT NULL,
  `mensagem` mediumtext NOT NULL,
  `data` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `demonstrativo-produtor`
--

CREATE TABLE `demonstrativo-produtor` (
  `CODIGO` int(11) DEFAULT NULL,
  `MATRICULA` int(11) DEFAULT NULL,
  `ANOMES` date DEFAULT NULL,
  `DESCRIÇÃO` varchar(40) DEFAULT NULL,
  `DECCRE` char(1) DEFAULT NULL,
  `VALOR` double DEFAULT NULL,
  `ID` int(11) DEFAULT NULL,
  `VLRLITRO` double DEFAULT NULL,
  `leite_total` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `matricula` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `valor` float(11,2) NOT NULL,
  `parcelas` int(3) NOT NULL,
  `finalidade` mediumtext NOT NULL,
  `data` datetime NOT NULL,
  `data_analise` datetime DEFAULT NULL,
  `data_apro_repro` datetime DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `eventos`
--

CREATE TABLE `eventos` (
  `id` int(11) UNSIGNED NOT NULL,
  `evento_faturamento` varchar(3) DEFAULT NULL,
  `matricula_empresa` varchar(8) DEFAULT NULL,
  `matricula_plano_saude` varchar(17) DEFAULT NULL,
  `nome_cliente` varchar(50) DEFAULT NULL,
  `idade` varchar(100) DEFAULT NULL,
  `qtd` varchar(2) DEFAULT NULL,
  `valor_evento` varchar(10) DEFAULT NULL,
  `vencimento` varchar(8) DEFAULT NULL,
  `data_evento` varchar(8) DEFAULT NULL,
  `guia` varchar(20) DEFAULT NULL,
  `descricao` varchar(80) DEFAULT NULL,
  `prestador` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `extrato-comprocard`
--

CREATE TABLE `extrato-comprocard` (
  `id` int(11) NOT NULL,
  `matricula` int(9) DEFAULT NULL,
  `dt_emissao` date DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `valor` float(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `extrato-ir`
--

CREATE TABLE `extrato-ir` (
  `ID` varchar(12) NOT NULL DEFAULT '',
  `anomes` date DEFAULT NULL,
  `matricula` int(20) DEFAULT NULL,
  `a2_cod` varchar(20) DEFAULT NULL,
  `A2_NOME` varchar(40) DEFAULT NULL,
  `a2_cgc` varchar(20) DEFAULT NULL,
  `prev` float(11,2) DEFAULT NULL,
  `rendimento` float(11,2) DEFAULT NULL,
  `prevpri` float(11,2) DEFAULT NULL,
  `seguro` float(11,2) DEFAULT NULL,
  `unimed` float(11,2) DEFAULT NULL,
  `funrural` float(11,2) DEFAULT NULL,
  `pensao` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `extrato-ir-composicao`
--

CREATE TABLE `extrato-ir-composicao` (
  `cod` int(6) DEFAULT NULL,
  `MSG` varchar(33) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `ID` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagem`
--

CREATE TABLE `imagem` (
  `id` int(11) NOT NULL,
  `largura` int(11) NOT NULL,
  `altura` int(11) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `capa` enum('1','2') NOT NULL DEFAULT '2',
  `noticia_id` int(11) NOT NULL,
  `mensagem_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `acao` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mensagem_aniversario`
--

CREATE TABLE `mensagem_aniversario` (
  `id` int(11) NOT NULL,
  `codigo` varchar(200) NOT NULL,
  `visibilidade` enum('1','2') NOT NULL DEFAULT '2',
  `imagem_fundo` enum('1','2') NOT NULL DEFAULT '2',
  `titulo` varchar(200) NOT NULL,
  `cor_fundo` varchar(50) NOT NULL,
  `cor_borda` varchar(50) NOT NULL,
  `espessura_borda` varchar(50) NOT NULL,
  `largura` varchar(50) NOT NULL,
  `altura` varchar(50) NOT NULL,
  `tamanho_fonte` varchar(50) NOT NULL,
  `cor_fonte` varchar(50) NOT NULL,
  `descricao` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `notas`
--

CREATE TABLE `notas` (
  `id` int(10) UNSIGNED NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_barras` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serie` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filial` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recebimento` date DEFAULT NULL,
  `entrega` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `carga` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dt_emissao` date DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '0 - NULL / 1 - Aceito / 2 - Negado',
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticias`
--

CREATE TABLE `noticias` (
  `id` int(11) NOT NULL,
  `titulo` varchar(500) NOT NULL,
  `descricao` text NOT NULL,
  `url` varchar(300) NOT NULL,
  `visibilidade` enum('1','2') NOT NULL DEFAULT '1',
  `codigo` varchar(200) NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pesquisa`
--

CREATE TABLE `pesquisa` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `visualizacao` enum('0','1') NOT NULL DEFAULT '1',
  `obrigatoria` enum('0','1') NOT NULL DEFAULT '0',
  `liberada` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pesquisa-alternativas`
--

CREATE TABLE `pesquisa-alternativas` (
  `id` int(11) NOT NULL,
  `texto` varchar(255) NOT NULL,
  `id_pergunta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pesquisa-cooperados`
--

CREATE TABLE `pesquisa-cooperados` (
  `id` int(11) NOT NULL,
  `id_pesquisa` int(11) NOT NULL,
  `id_cooperado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pesquisa-perguntas`
--

CREATE TABLE `pesquisa-perguntas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `linear_inicio` int(1) NOT NULL,
  `linear_fim` int(2) NOT NULL,
  `obrigatoria` enum('0','1') NOT NULL DEFAULT '0',
  `id_pesquisa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pesquisa-respostas`
--

CREATE TABLE `pesquisa-respostas` (
  `id` int(11) NOT NULL,
  `id_pergunta` int(11) NOT NULL,
  `id_alternativa` int(11) DEFAULT NULL,
  `id_cooperado` int(11) NOT NULL,
  `valor` int(11) DEFAULT NULL,
  `texto` varchar(255) DEFAULT NULL,
  `paragrafo` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `qualidade-leite`
--

CREATE TABLE `qualidade-leite` (
  `id` int(11) NOT NULL,
  `tanque` int(6) DEFAULT NULL,
  `matricula` int(9) DEFAULT NULL,
  `faixa` char(1) DEFAULT NULL,
  `zle_dtfim` int(11) DEFAULT NULL,
  `mes_ano` date DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `VALOR` decimal(19,4) DEFAULT NULL,
  `valor_a` decimal(19,4) DEFAULT NULL,
  `gordura` float(11,2) DEFAULT NULL,
  `zz3_est` float(11,2) DEFAULT NULL,
  `ccs` int(11) DEFAULT NULL,
  `cbt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `saldo-financeiro`
--

CREATE TABLE `saldo-financeiro` (
  `id` int(11) NOT NULL,
  `DIAS_SEM_MANDAR_LEITE` int(11) DEFAULT NULL,
  `COD_EVENTO` int(11) DEFAULT NULL,
  `evento` varchar(50) DEFAULT NULL,
  `DT_VENCIMENTO` datetime DEFAULT NULL,
  `VLR_SALDO` double DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `status_chamados`
--

CREATE TABLE `status_chamados` (
  `id` int(2) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `status_emprestimos`
--

CREATE TABLE `status_emprestimos` (
  `id` int(2) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tanques`
--

CREATE TABLE `tanques` (
  `id` int(11) NOT NULL,
  `codigo` int(6) DEFAULT NULL,
  `codigo_cacal` varchar(12) DEFAULT NULL,
  `tanque` int(6) DEFAULT NULL,
  `latao` int(6) DEFAULT NULL,
  `matricula` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `alterar_senha` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `senha` varchar(250) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `nome` varchar(200) NOT NULL,
  `acesso` enum('1','2') NOT NULL DEFAULT '2' COMMENT '1 - Liberado, 2 - Bloqueado',
  `data_cadastro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `volume-leite`
--

CREATE TABLE `volume-leite` (
  `matricula` int(9) DEFAULT NULL,
  `dia_coleta` int(10) DEFAULT NULL,
  `zld_tanque` int(10) DEFAULT NULL,
  `zld_latao` int(9) DEFAULT NULL,
  `qtd_leite` int(9) DEFAULT NULL,
  `qtd_leite_acido` int(15) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `arquivo_unimed`
--
ALTER TABLE `arquivo_unimed`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `associados`
--
ALTER TABLE `associados`
  ADD KEY `idx_associados_lookup` (`id`);

--
-- Índices de tabela `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `celular`
--
ALTER TABLE `celular`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `chamados`
--
ALTER TABLE `chamados`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `chamados_arquivos`
--
ALTER TABLE `chamados_arquivos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `chamados_mensagens`
--
ALTER TABLE `chamados_mensagens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chamados_mensagens` (`chamado_id`);

--
-- Índices de tabela `configuracao`
--
ALTER TABLE `configuracao`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `conta-capital-regpag`
--
ALTER TABLE `conta-capital-regpag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_conta-capital-regpag_lookup` (`codigo`,`EMISSAO`,`historico`,`BAIXA`,`RECPAG`);

--
-- Índices de tabela `conta-capital-resumo`
--
ALTER TABLE `conta-capital-resumo`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cooperados`
--
ALTER TABLE `cooperados`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `demonstrativo-mensagens`
--
ALTER TABLE `demonstrativo-mensagens`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `demonstrativo-produtor`
--
ALTER TABLE `demonstrativo-produtor`
  ADD KEY `idx_demonstrativo-produtor_lookup` (`ID`);

--
-- Índices de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `extrato-comprocard`
--
ALTER TABLE `extrato-comprocard`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `extrato-ir`
--
ALTER TABLE `extrato-ir`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idx_extrato-ir_lookup` (`anomes`,`matricula`,`a2_cod`);

--
-- Índices de tabela `imagem`
--
ALTER TABLE `imagem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mensagem_aniversario`
--
ALTER TABLE `mensagem_aniversario`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pesquisa`
--
ALTER TABLE `pesquisa`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pesquisa-alternativas`
--
ALTER TABLE `pesquisa-alternativas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_alternitivas_perguntas` (`id_pergunta`);

--
-- Índices de tabela `pesquisa-cooperados`
--
ALTER TABLE `pesquisa-cooperados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cp_pesss` (`id_pesquisa`);

--
-- Índices de tabela `pesquisa-perguntas`
--
ALTER TABLE `pesquisa-perguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pergunta_pesquisa` (`id_pesquisa`);

--
-- Índices de tabela `pesquisa-respostas`
--
ALTER TABLE `pesquisa-respostas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_resp_perg` (`id_pergunta`);

--
-- Índices de tabela `qualidade-leite`
--
ALTER TABLE `qualidade-leite`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `saldo-financeiro`
--
ALTER TABLE `saldo-financeiro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_saldo-financeiro_lookup` (`COD_EVENTO`,`codigo`,`DT_VENCIMENTO`);

--
-- Índices de tabela `status_chamados`
--
ALTER TABLE `status_chamados`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `status_emprestimos`
--
ALTER TABLE `status_emprestimos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tanques`
--
ALTER TABLE `tanques`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `volume-leite`
--
ALTER TABLE `volume-leite`
  ADD KEY `idx_volume-leite_lookup` (`matricula`,`data`,`zld_tanque`,`zld_latao`),
  ADD KEY `idx_volume-leite` (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `arquivo_unimed`
--
ALTER TABLE `arquivo_unimed`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `celular`
--
ALTER TABLE `celular`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `chamados`
--
ALTER TABLE `chamados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `chamados_arquivos`
--
ALTER TABLE `chamados_arquivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `chamados_mensagens`
--
ALTER TABLE `chamados_mensagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `configuracao`
--
ALTER TABLE `configuracao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `conta-capital-regpag`
--
ALTER TABLE `conta-capital-regpag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `conta-capital-resumo`
--
ALTER TABLE `conta-capital-resumo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cooperados`
--
ALTER TABLE `cooperados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `demonstrativo-mensagens`
--
ALTER TABLE `demonstrativo-mensagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `extrato-comprocard`
--
ALTER TABLE `extrato-comprocard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `imagem`
--
ALTER TABLE `imagem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mensagem_aniversario`
--
ALTER TABLE `mensagem_aniversario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pesquisa`
--
ALTER TABLE `pesquisa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pesquisa-alternativas`
--
ALTER TABLE `pesquisa-alternativas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pesquisa-cooperados`
--
ALTER TABLE `pesquisa-cooperados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pesquisa-perguntas`
--
ALTER TABLE `pesquisa-perguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pesquisa-respostas`
--
ALTER TABLE `pesquisa-respostas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `qualidade-leite`
--
ALTER TABLE `qualidade-leite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `saldo-financeiro`
--
ALTER TABLE `saldo-financeiro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `status_chamados`
--
ALTER TABLE `status_chamados`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `status_emprestimos`
--
ALTER TABLE `status_emprestimos`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tanques`
--
ALTER TABLE `tanques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `chamados_mensagens`
--
ALTER TABLE `chamados_mensagens`
  ADD CONSTRAINT `fk_chamados_mensagens` FOREIGN KEY (`chamado_id`) REFERENCES `chamados` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `pesquisa-alternativas`
--
ALTER TABLE `pesquisa-alternativas`
  ADD CONSTRAINT `fk_alternitivas_perguntas` FOREIGN KEY (`id_pergunta`) REFERENCES `pesquisa-perguntas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `pesquisa-cooperados`
--
ALTER TABLE `pesquisa-cooperados`
  ADD CONSTRAINT `fk_cp_pesss` FOREIGN KEY (`id_pesquisa`) REFERENCES `pesquisa` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `pesquisa-perguntas`
--
ALTER TABLE `pesquisa-perguntas`
  ADD CONSTRAINT `fk_pergunta_pesquisa` FOREIGN KEY (`id_pesquisa`) REFERENCES `pesquisa` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `pesquisa-respostas`
--
ALTER TABLE `pesquisa-respostas`
  ADD CONSTRAINT `fk_resp_perg` FOREIGN KEY (`id_pergunta`) REFERENCES `pesquisa-perguntas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

INSERT INTO `cooperados` VALUES(6802, 6802, 6802, 293, 'ARLINDO MOREIRA MACHADO                 ', '01481150715   ', 'F', '28', '992777963                                         ', NULL, NULL, NULL, '79132128', 71, 'RUA JOHN KENNEDY 209     MARATAIZES     ', '      ', 'CENTRO              ', 'ES', '04302', 'PRESIDENTE KENN', '29490000', '110.081.390       ', '32693800   ', '508063006092', 1, '1926-12-15 00:00:00', '1', '2');
INSERT INTO `cooperados` VALUES(6803, 6803, 6803, 326, 'ESPOLIO CLEUSON REBELLO/VILMA NEVES REBE', '01481118749   ', 'F', '28 ', '35224217                                         ', NULL, NULL, NULL, '68320101', 148, 'AV.PINHEIRO JUNIOR, 60 - AP.502-IBITIQUA', '      ', 'ZONA RURAL          ', 'ES', '01209', 'CACHOEIRO DE IT', '29350000', '110.008.774       ', '7660315    ', '298389320000', 1, '1931-09-17 00:00:00', '1', '2');


INSERT INTO `tanques` VALUES(6803, 6802, '006802', 1306, 1395, 293);
INSERT INTO `tanques` VALUES(6804, 6803, '006803', 335, 579, 326);


INSERT INTO `qualidade-leite` (`id`, `tanque`, `matricula`, `faixa`, `zle_dtfim`, `mes_ano`, `volume`, `VALOR`, `valor_a`, `gordura`, `zz3_est`, `ccs`, `cbt`) VALUES
(68013, 1306, 293, 'B', 201702, '2019-04-01', 2316, 69.4800, 92.6400, 3.20, 12.10, 171, 129),
(70189, 1306, 293, 'B', 201703, '2019-05-01', 1741, 52.2300, 69.6400, 3.50, 12.39, 178, 320),
(72625, 1306, 293, 'C', 201704, '2019-06-01', 2022, 40.4400, 80.8800, 3.40, 12.38, 338, 280),
(76812, 1306, 293, 'A', 201705, '2019-07-01', 2812, 112.4800, 112.4800, 3.50, 12.62, 216, 130),
(81013, 1306, 293, 'D', 201706, '2019-08-01', 2859, 28.5900, 114.3600, 2.90, 11.96, 182, 305),
(83472, 1306, 293, 'E', 201707, '2019-09-01', 2802, 0.0000, 112.0800, 3.20, 11.96, 121, 845),
(85700, 1306, 293, 'D', 201708, '2019-10-01', 2981, 29.8100, 119.2400, 2.70, 11.46, 86, 279),
(87659, 1306, 293, 'D', 201709, '2019-11-01', 2829, 28.2900, 113.1600, 2.70, 11.55, 86, 210),
(90056, 1306, 293, 'E', 201710, '2019-12-01', 3043, 0.0000, 121.7200, 3.00, 11.58, 105, 468),
(133556, 1306, 293, 'D', 201906, '2020-01-01', 2460, 24.6000, 98.4000, 3.00, 11.40, 262, 255),
(138188, 1306, 293, 'D', 201907, '2020-02-01', 2026, 20.2600, 81.0400, 3.30, 11.97, 258, 244),
(140162, 1306, 293, 'C', 201908, '2020-03-01', 1831, 36.6200, 73.2400, 3.40, 12.02, 275, 482),
(142318, 1306, 293, 'B', 201909, '2020-04-01', 1742, 52.2600, 69.6800, 3.70, 12.59, 227, 217),
(986921, 335, 326, 'F', 201802, '2019-01-01', 4868, -48.6800, 194.7200, 3.80, 12.33, 2305, 956),
(1008851, 335, 326, 'F', 201803, '2019-02-01', 4529, -45.2900, 181.1600, 3.70, 12.31, 1426, 752),
(1030841, 335, 326, 'B', 201804, '2019-03-01', 4868, 146.0400, 194.7200, 4.20, 12.84, 2159, 71),
(1050132, 335, 326, 'C', 201805, '2019-04-01', 4818, 96.3600, 192.7200, 4.20, 13.08, 2368, 131),
(1071851, 335, 326, 'E', 201806, '2019-05-01', 4635, 0.0000, 185.4000, 3.80, 12.43, 1902, 223),
(1095981, 335, 326, 'E', 201807, '2019-06-01', 4711, 0.0000, 188.4400, 3.50, 12.07, 1026, 565),
(1115381, 335, 326, 'E', 201808, '2019-07-01', 4688, 0.0000, 187.5200, 3.70, 12.33, 1629, 454),
(1139591, 335, 326, 'E', 201809, '2019-08-01', 3722, 0.0000, 148.8800, 3.70, 12.28, 1519, 414);
(98692, 335, 326, 'F', 201802, '2019-09-01', 4868, -48.6800, 194.7200, 3.80, 12.33, 2305, 956),
(100885, 335, 326, 'F', 201803, '2019-10-01', 4529, -45.2900, 181.1600, 3.70, 12.31, 1426, 752),
(103084, 335, 326, 'B', 201804, '2019-11-01', 4868, 146.0400, 194.7200, 4.20, 12.84, 2159, 71),
(1050131, 335, 326, 'C', 201805, '2019-12-01', 4818, 96.3600, 192.7200, 4.20, 13.08, 2368, 131),
(107185, 335, 326, 'E', 201806, '2020-01-01', 4635, 0.0000, 185.4000, 3.80, 12.43, 1902, 223),
(109598, 335, 326, 'E', 201807, '2020-02-01', 4711, 0.0000, 188.4400, 3.50, 12.07, 1026, 565),
(111538, 335, 326, 'E', 201808, '2020-03-01', 4688, 0.0000, 187.5200, 3.70, 12.33, 1629, 454),
(11395, 335, 326, 'E', 201809, '2020-04-01', 3722, 0.0000, 148.8800, 3.70, 12.28, 1519, 414);

INSERT INTO formulario (id, Titulo)
VALUES (1, "Diagnóstico da Propriedade");
INSERT INTO formulario (id, Titulo)
VALUES (2, "Nivelamento de Tecnologia");


INSERT INTO tema (id, nome)
VALUES (1, "Manejo de ordenha");
INSERT INTO tema (id, nome)
VALUES (2, "Animais");
INSERT INTO tema (id, nome)
VALUES (3, "Equipamentos");
INSERT INTO tema (id, nome)
VALUES (4, "Higiene");




INSERT INTO pergunta (id, enunciado, formulario_id, tema_id) 
VALUES (1,"Condição tetos antes da ordenha:", 1, 4);
INSERT INTO pergunta (id, enunciado, formulario_id, tema_id)
VALUES (2, "O teste da caneca é feito?", 1, 1);
INSERT INTO pergunta (id, enunciado, formulario_id, tema_id)
VALUES (3, "Utiliza boi reprodutor", 2, 2);
INSERT INTO pergunta (id, enunciado, formulario_id, tema_id)
VALUES (4, "Realiza inseminação?", 2, 2);
INSERT INTO pergunta (id, enunciado, formulario_id, tema_id)
VALUES (5, "Realiza inseminação?", 1, 2);
INSERT INTO pergunta (id, enunciado, formulario_id, tema_id) 
VALUES (6, "Utiliza boi reprodutor", 1, 2);
INSERT INTO pergunta (id, enunciado, formulario_id, tema_id)
VALUES (7, "Utiliza Ordenha mecânica?", 2, 3);
INSERT INTO pergunta (id, enunciado, formulario_id, tema_id)
VALUES (8, "Higienização da Ordenhadeira", 2, 1);

INSERT INTO opcao (id,  nome_opcao)
VALUES (1, "Limpos");
INSERT INTO opcao (id,  nome_opcao)
VALUES (2, "Sujos");
INSERT INTO opcao (id,  nome_opcao)
VALUES (3, "Muito sujos");
INSERT INTO opcao (id,  nome_opcao)
VALUES (4, "Sim");
INSERT INTO opcao (id,  nome_opcao)
VALUES (5, "Não");

INSERT INTO opcaopergunta (id,  opcao_id, pergunta_id, positiva)
VALUES (1, 1, 1, 1);
INSERT INTO opcaopergunta (id,  opcao_id, pergunta_id, positiva)
VALUES (2, 2, 1, 0);
INSERT INTO opcaopergunta (id,  opcao_id, pergunta_id, positiva)
VALUES (3, 3, 1, 0);

INSERT INTO opcaopergunta (id,  opcao_id, pergunta_id, positiva)
VALUES (4, 4, 2, 1);
INSERT INTO opcaopergunta (id,  opcao_id, pergunta_id, positiva)
VALUES (5, 5, 2, 0);

INSERT INTO opcaopergunta (id,  opcao_id, pergunta_id, positiva)
VALUES (6, 4, 3, 1);
INSERT INTO opcaopergunta (id,  opcao_id, pergunta_id, positiva)
VALUES (7, 5, 3, 0);

INSERT INTO opcaopergunta (id,  opcao_id, pergunta_id, positiva)
VALUES (8, 4, 4, 0);
INSERT INTO opcaopergunta (id,  opcao_id, pergunta_id, positiva)
VALUES (9, 5, 4, 1);

INSERT INTO opcaopergunta (id,  opcao_id, pergunta_id, positiva)
VALUES (10, 5, 5, 0);
INSERT INTO opcaopergunta (id,  opcao_id, pergunta_id, positiva)
VALUES (11, 4, 5, 1);

INSERT INTO opcaopergunta (id,  opcao_id, pergunta_id, positiva)
VALUES (12, 5, 6, 1);
INSERT INTO opcaopergunta (id,  opcao_id, pergunta_id, positiva)
VALUES (13, 4, 6, 0);

INSERT INTO opcaopergunta (id,  opcao_id, pergunta_id, positiva)
VALUES (14, 4, 7, 1);
INSERT INTO opcaopergunta (id,  opcao_id, pergunta_id, positiva)
VALUES (15, 5, 7, 0);

INSERT INTO opcaopergunta (id,  opcao_id, pergunta_id, positiva)
VALUES (16, 1, 8, 1);
INSERT INTO opcaopergunta (id,  opcao_id, pergunta_id, positiva)
VALUES (17, 2, 8, 0);
INSERT INTO opcaopergunta (id,  opcao_id, pergunta_id, positiva)
VALUES (18, 3, 8, 0);






