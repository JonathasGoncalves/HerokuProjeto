-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gestao_local
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `arquivo_unimed`
--

DROP TABLE IF EXISTS `arquivo_unimed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arquivo_unimed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `associados`
--

DROP TABLE IF EXISTS `associados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
  `DT_NIVER` datetime DEFAULT NULL,
  KEY `idx_associados_lookup` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(300) NOT NULL,
  `arquivo_nome` varchar(300) NOT NULL,
  `frase_alt_title` varchar(300) NOT NULL,
  `url` text,
  `target` enum('1','2') NOT NULL DEFAULT '1',
  `visibilidade` enum('1','2') NOT NULL DEFAULT '1',
  `codigo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `celular`
--

DROP TABLE IF EXISTS `celular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `celular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` int(9) DEFAULT NULL,
  `cooperado` varchar(100) DEFAULT NULL,
  `celular` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chamados`
--

DROP TABLE IF EXISTS `chamados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chamados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `assunto` varchar(250) NOT NULL,
  `data` datetime NOT NULL,
  `data_modificado` datetime DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chamados_arquivos`
--

DROP TABLE IF EXISTS `chamados_arquivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chamados_arquivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chamado_id` int(11) NOT NULL,
  `arquivo` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chamados_mensagens`
--

DROP TABLE IF EXISTS `chamados_mensagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chamados_mensagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `cliente_nome` varchar(255) NOT NULL,
  `chamado_id` int(11) NOT NULL,
  `mensagem` longtext NOT NULL,
  `data` datetime NOT NULL,
  `tipo` enum('1','2') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_chamados_mensagens` (`chamado_id`),
  CONSTRAINT `fk_chamados_mensagens` FOREIGN KEY (`chamado_id`) REFERENCES `chamados` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configuracao`
--

DROP TABLE IF EXISTS `configuracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuracao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_destaque` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conta-capital-regpag`
--

DROP TABLE IF EXISTS `conta-capital-regpag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conta-capital-regpag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(6) DEFAULT NULL,
  `VALOR` double DEFAULT NULL,
  `EMISSAO` datetime DEFAULT NULL,
  `VENCIMENTO` datetime DEFAULT NULL,
  `historico` varchar(50) DEFAULT NULL,
  `BAIXA` datetime DEFAULT NULL,
  `RECPAG` char(1) DEFAULT NULL,
  `NATUREZA` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_conta-capital-regpag_lookup` (`codigo`,`EMISSAO`,`historico`,`BAIXA`,`RECPAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conta-capital-resumo`
--

DROP TABLE IF EXISTS `conta-capital-resumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conta-capital-resumo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(6) DEFAULT NULL,
  `dt_admissao` datetime DEFAULT NULL,
  `matricula` int(9) DEFAULT NULL,
  `vlr_subs` double DEFAULT NULL,
  `vlr_integra` double DEFAULT NULL,
  `dt_movimento` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cooperados`
--

DROP TABLE IF EXISTS `cooperados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cooperados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `exibir_pop_up_extrato_digital` enum('1','2') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6804 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `demonstrativo-mensagens`
--

DROP TABLE IF EXISTS `demonstrativo-mensagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demonstrativo-mensagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mensagem` mediumtext NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `demonstrativo-produtor`
--

DROP TABLE IF EXISTS `demonstrativo-produtor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demonstrativo-produtor` (
  `CODIGO` int(11) DEFAULT NULL,
  `MATRICULA` int(11) DEFAULT NULL,
  `ANOMES` date DEFAULT NULL,
  `DESCRIÇÃO` varchar(40) DEFAULT NULL,
  `DECCRE` char(1) DEFAULT NULL,
  `VALOR` double DEFAULT NULL,
  `ID` int(11) DEFAULT NULL,
  `VLRLITRO` double DEFAULT NULL,
  `leite_total` int(11) DEFAULT NULL,
  KEY `idx_demonstrativo-produtor_lookup` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emprestimos`
--

DROP TABLE IF EXISTS `emprestimos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventoagenda`
--

DROP TABLE IF EXISTS `eventoAgenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventoAgenda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `tecnico_id` int(10) unsigned NOT NULL,
  `fomulario_id` int(10) unsigned NOT NULL,
  `tanque_id` int(11) NOT NULL,
  `submissao_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eventoagenda_fomulario_id_foreign` (`fomulario_id`),
  KEY `eventoagenda_tecnico_id_foreign` (`tecnico_id`),
  KEY `eventoagenda_tanque_id_foreign` (`tanque_id`),
  KEY `eventoagenda_submissao_id_foreign` (`submissao_id`),
  CONSTRAINT `eventoagenda_fomulario_id_foreign` FOREIGN KEY (`fomulario_id`) REFERENCES `formulario` (`id`),
  CONSTRAINT `eventoagenda_submissao_id_foreign` FOREIGN KEY (`submissao_id`) REFERENCES `submissao` (`id`),
  CONSTRAINT `eventoagenda_tanque_id_foreign` FOREIGN KEY (`tanque_id`) REFERENCES `tanques` (`id`),
  CONSTRAINT `eventoagenda_tecnico_id_foreign` FOREIGN KEY (`tecnico_id`) REFERENCES `tecnico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
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
  `prestador` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extrato-comprocard`
--

DROP TABLE IF EXISTS `extrato-comprocard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extrato-comprocard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` int(9) DEFAULT NULL,
  `dt_emissao` date DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `valor` float(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extrato-ir`
--

DROP TABLE IF EXISTS `extrato-ir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
  `pensao` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_extrato-ir_lookup` (`anomes`,`matricula`,`a2_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extrato-ir-composicao`
--

DROP TABLE IF EXISTS `extrato-ir-composicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extrato-ir-composicao` (
  `cod` int(6) DEFAULT NULL,
  `MSG` varchar(33) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `ID` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formulario`
--

DROP TABLE IF EXISTS `formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formulario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagem`
--

DROP TABLE IF EXISTS `imagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `largura` int(11) NOT NULL,
  `altura` int(11) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `capa` enum('1','2') NOT NULL DEFAULT '2',
  `noticia_id` int(11) NOT NULL,
  `mensagem_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagemobs`
--

DROP TABLE IF EXISTS `imagemobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagemobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `respostaObservacao_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imagemobs_respostaobservacao_id_foreign` (`respostaObservacao_id`),
  CONSTRAINT `imagemobs_respostaobservacao_id_foreign` FOREIGN KEY (`respostaObservacao_id`) REFERENCES `respostaobservacao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `acao` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mensagem_aniversario`
--

DROP TABLE IF EXISTS `mensagem_aniversario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensagem_aniversario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `descricao` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_barras` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serie` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filial` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recebimento` date DEFAULT NULL,
  `entrega` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `carga` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dt_emissao` date DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '0 - NULL / 1 - Aceito / 2 - Negado',
  `user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `noticias`
--

DROP TABLE IF EXISTS `noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(500) NOT NULL,
  `descricao` text NOT NULL,
  `url` varchar(300) NOT NULL,
  `visibilidade` enum('1','2') NOT NULL DEFAULT '1',
  `codigo` varchar(200) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `opcao`
--

DROP TABLE IF EXISTS `opcao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opcao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_opcao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `opcaopergunta`
--

DROP TABLE IF EXISTS `opcaopergunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opcaopergunta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `opcao_id` int(10) unsigned NOT NULL,
  `pergunta_id` int(10) unsigned NOT NULL,
  `positiva` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `opcaopergunta_opcao_id_foreign` (`opcao_id`),
  KEY `opcaopergunta_pergunta_id_foreign` (`pergunta_id`),
  CONSTRAINT `opcaopergunta_opcao_id_foreign` FOREIGN KEY (`opcao_id`) REFERENCES `opcao` (`id`),
  CONSTRAINT `opcaopergunta_pergunta_id_foreign` FOREIGN KEY (`pergunta_id`) REFERENCES `pergunta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `opcaopergunta_submissao`
--

DROP TABLE IF EXISTS `OpcaoPergunta_submissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OpcaoPergunta_submissao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `opcao_pergunta_id` int(10) unsigned NOT NULL,
  `submissao_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `opcaopergunta_submissao_opcao_pergunta_id_foreign` (`opcao_pergunta_id`),
  KEY `opcaopergunta_submissao_submissao_id_foreign` (`submissao_id`),
  CONSTRAINT `opcaopergunta_submissao_opcao_pergunta_id_foreign` FOREIGN KEY (`opcao_pergunta_id`) REFERENCES `opcaopergunta` (`id`),
  CONSTRAINT `opcaopergunta_submissao_submissao_id_foreign` FOREIGN KEY (`submissao_id`) REFERENCES `submissao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pergunta`
--

DROP TABLE IF EXISTS `pergunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pergunta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `enunciado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `formulario_id` int(10) unsigned NOT NULL,
  `tema_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pergunta_formulario_id_foreign` (`formulario_id`),
  KEY `pergunta_tema_id_foreign` (`tema_id`),
  CONSTRAINT `pergunta_formulario_id_foreign` FOREIGN KEY (`formulario_id`) REFERENCES `formulario` (`id`),
  CONSTRAINT `pergunta_tema_id_foreign` FOREIGN KEY (`tema_id`) REFERENCES `tema` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pesquisa`
--

DROP TABLE IF EXISTS `pesquisa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pesquisa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `visualizacao` enum('0','1') NOT NULL DEFAULT '1',
  `obrigatoria` enum('0','1') NOT NULL DEFAULT '0',
  `liberada` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pesquisa-alternativas`
--

DROP TABLE IF EXISTS `pesquisa-alternativas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pesquisa-alternativas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texto` varchar(255) NOT NULL,
  `id_pergunta` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_alternitivas_perguntas` (`id_pergunta`),
  CONSTRAINT `fk_alternitivas_perguntas` FOREIGN KEY (`id_pergunta`) REFERENCES `pesquisa-perguntas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pesquisa-cooperados`
--

DROP TABLE IF EXISTS `pesquisa-cooperados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pesquisa-cooperados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pesquisa` int(11) NOT NULL,
  `id_cooperado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cp_pesss` (`id_pesquisa`),
  CONSTRAINT `fk_cp_pesss` FOREIGN KEY (`id_pesquisa`) REFERENCES `pesquisa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pesquisa-perguntas`
--

DROP TABLE IF EXISTS `pesquisa-perguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pesquisa-perguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `linear_inicio` int(1) NOT NULL,
  `linear_fim` int(2) NOT NULL,
  `obrigatoria` enum('0','1') NOT NULL DEFAULT '0',
  `id_pesquisa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pergunta_pesquisa` (`id_pesquisa`),
  CONSTRAINT `fk_pergunta_pesquisa` FOREIGN KEY (`id_pesquisa`) REFERENCES `pesquisa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pesquisa-respostas`
--

DROP TABLE IF EXISTS `pesquisa-respostas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pesquisa-respostas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pergunta` int(11) NOT NULL,
  `id_alternativa` int(11) DEFAULT NULL,
  `id_cooperado` int(11) NOT NULL,
  `valor` int(11) DEFAULT NULL,
  `texto` varchar(255) DEFAULT NULL,
  `paragrafo` mediumtext,
  PRIMARY KEY (`id`),
  KEY `fk_resp_perg` (`id_pergunta`),
  CONSTRAINT `fk_resp_perg` FOREIGN KEY (`id_pergunta`) REFERENCES `pesquisa-perguntas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qualidade-leite`
--

DROP TABLE IF EXISTS `qualidade-leite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qualidade-leite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `cbt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142319 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `respostaobservacao`
--

DROP TABLE IF EXISTS `respostaobservacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respostaobservacao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `texto_observacao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tema_id` int(10) unsigned NOT NULL,
  `submissao_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `respostaobservacao_tema_id_foreign` (`tema_id`),
  KEY `respostaobservacao_submissao_id_foreign` (`submissao_id`),
  CONSTRAINT `respostaobservacao_submissao_id_foreign` FOREIGN KEY (`submissao_id`) REFERENCES `submissao` (`id`),
  CONSTRAINT `respostaobservacao_tema_id_foreign` FOREIGN KEY (`tema_id`) REFERENCES `tema` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saldo-financeiro`
--

DROP TABLE IF EXISTS `saldo-financeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saldo-financeiro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DIAS_SEM_MANDAR_LEITE` int(11) DEFAULT NULL,
  `COD_EVENTO` int(11) DEFAULT NULL,
  `evento` varchar(50) DEFAULT NULL,
  `DT_VENCIMENTO` datetime DEFAULT NULL,
  `VLR_SALDO` double DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_saldo-financeiro_lookup` (`COD_EVENTO`,`codigo`,`DT_VENCIMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status_chamados`
--

DROP TABLE IF EXISTS `status_chamados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_chamados` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status_emprestimos`
--

DROP TABLE IF EXISTS `status_emprestimos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_emprestimos` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `submissao`
--

DROP TABLE IF EXISTS `submissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DataSubmissao` datetime NOT NULL,
  `qualidade_id` int(11) DEFAULT NULL,
  `tanque_id` int(11) NOT NULL,
  `realizada` int(11) NOT NULL,
  `tecnico_id` int(10) unsigned NOT NULL,
  `aproveitamento` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `submissao_tanque_id_foreign` (`tanque_id`),
  KEY `submissao_qualidade_id_foreign` (`qualidade_id`),
  KEY `submissao_tecnico_id_foreign` (`tecnico_id`),
  CONSTRAINT `submissao_qualidade_id_foreign` FOREIGN KEY (`qualidade_id`) REFERENCES `qualidade-leite` (`id`),
  CONSTRAINT `submissao_tanque_id_foreign` FOREIGN KEY (`tanque_id`) REFERENCES `tanques` (`id`),
  CONSTRAINT `submissao_tecnico_id_foreign` FOREIGN KEY (`tecnico_id`) REFERENCES `tecnico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tanques`
--

DROP TABLE IF EXISTS `tanques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tanques` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(6) DEFAULT NULL,
  `codigo_cacal` varchar(12) DEFAULT NULL,
  `tanque` int(6) DEFAULT NULL,
  `latao` int(6) DEFAULT NULL,
  `matricula` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6805 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tecnico`
--

DROP TABLE IF EXISTS `tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnico` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tema`
--

DROP TABLE IF EXISTS `tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `alterar_senha` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `senha` varchar(250) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `nome` varchar(200) NOT NULL,
  `acesso` enum('1','2') NOT NULL DEFAULT '2' COMMENT '1 - Liberado, 2 - Bloqueado',
  `data_cadastro` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volume-leite`
--

DROP TABLE IF EXISTS `volume-leite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volume-leite` (
  `matricula` int(9) DEFAULT NULL,
  `dia_coleta` int(10) DEFAULT NULL,
  `zld_tanque` int(10) DEFAULT NULL,
  `zld_latao` int(9) DEFAULT NULL,
  `qtd_leite` int(9) DEFAULT NULL,
  `qtd_leite_acido` int(15) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  KEY `idx_volume-leite_lookup` (`matricula`,`data`,`zld_tanque`,`zld_latao`),
  KEY `idx_volume-leite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-02 16:54:14
